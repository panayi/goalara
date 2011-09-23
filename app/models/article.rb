require 'open-uri'
require 'paperclip'


class Article < ActiveRecord::Base
  
  self.per_page = 24
  
  belongs_to :feed
  belongs_to :organization
  has_and_belongs_to_many :team
  
  is_impressionable
  
  has_many :comments

  acts_as_commentable

  time = Time.new
  # Paperclip.options[:command_path] = "/usr/local/bin/"
  has_attached_file :image, :styles => {:thumb => "150x150#", :medium => "300x300#", :large => "600x600#"}
                    # :path => ":rails_root/public/articles/images/" + time.month.to_s() + "-" + time.year.to_s() + "/:id/:style/:filename"
  
  validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/gif"]
  
  
  scope :belongs_to_team, lambda { |*team_id|
    unless team_id.first.nil?
      { :include => :team, :conditions =>
        ["teams.id = ?", team_id]
      }
    end
  }
  
  scope :has_team, lambda {
      { :include => :team, :conditions =>
        ["teams.id is not null"]
      }
  }
  
  scope :today_or_yesterday, lambda { 
    where("articles.created_at IS NOT NULL AND date(articles.created_at) >= ?", Date.yesterday)
  }
  
  
  scope :published_since, lambda { |ago|
    published.where("articles.created_at >= ?", ago)
  }
  
  scope :order_by, lambda { |*args| {:order => (args.first || 'id') } }
  scope :filter_by, lambda { |*args| {:conditions => (args.second.nil? || args.second.empty?) ? nil : [args.first + " = ?", args.second]} }
  
  def self.get_articles(params)
    if params[:team_id] == "all"
      params[:team_id] = nil
    end
    
    case params[:order_by]
    when 'popular'
      return Article.has_team.
                     today_or_yesterday.
                     belongs_to_team(params[:team_id]).
                     paginate(:page => params[:page]).
                     sort{ |u| -u.impressionist_count }

    
    # TODO ===  Sort by:  {number of comments}
    #when 'commented'
      #
      # @articles = Article.belongs_to_team(params[:team_id]).all(:select=> "articles.*, COUNT(articles.id) AS comments_count",
      #                                 :joins => :comments, 
      #                                 :group => "articles.id", 
      #                                 :order => "comments_count")
        
    else #sort by date
      return Article.has_team.
                     today_or_yesterday.
                     belongs_to_team(params[:team_id]).
                     order_by("articles.id").
                     paginate(:page => params[:page])
                     
    end
    
  end
  
  def self.update_feeds() 
    the_feeds = Feed.find(:all)
    the_feeds.each do |this_feed|
      feedzir = Feedzirra::Feed.fetch_and_parse(this_feed.feed_url)  
      feedzir.entries.each do |entry|  
        unless exists? :url => entry.url
          
          if entry.url == this_feed.feed_url
            next
          end
          
          parsed = parse_div_content2(
              entry.url, 
              { 'content' => this_feed.content_unique_div, 
                'category' => this_feed.category_unique_div, 
                'image' => this_feed.image_unique_div
              },
              this_feed.site_url
              )
          
                        
          create!(  
            :title          => entry.title,  
            :summary        => entry.summary,
            :content        => parsed["content"],
            :category       => parsed["category"],
            :image          => parsed["image"],
            :url            => entry.url,
            :published_at   => entry.published,  
            :guid           => entry.id,
            :feed_id        => this_feed.id
          )
          # calculates tf-idf content and stores into Article.tf_idf_content
          calculate_tf_idf
          
          #TODO: uncomment the line below!!!
          tag_team_to_article_bayes(Article.last)
          
          if parsed["image"] != nil 
            parsed["image"] = add_feed_url_to_link(parsed["image"], this_feed.site_url)
            just_created.image_from_url(parsed["image"]);
          end
        end  
      end
    end
  end
  
  
  def self.parse_div_content(url, div)
    puts url
    Scraper::Base.parser :html_parser
    
    scraper = Scraper.define do
      array :items
      process div, :div_content => :text
      result :div_content
    end

    uri = URI.parse(url)

    t = HTMLEntities.new.decode scraper.scrape(uri).force_encoding('UTF-8')

    return t
    #return Iconv.conv('utf-8//IGNORE', 'utf-8', scraper.scrape(uri) ) 
  end
  
  def self.parse_div_content2(url, div, site_url)
    doc = Nokogiri::HTML(open(url))
    
    parsed = {}
    #content div
    if !div["content"].nil?
      parsed["content"] = doc.css(div["content"]).first.content
    else
      parsed["content"] = nil
    end

    #category div
    if !div["category"].nil?
      element = doc.css(div["category"])
      if !element.first.nil?
        parsed["category"] = element.first.content
      end
    else
      parsed["category"] = nil
    end
    
    #image div
    parsed["image"] = find_biggest_image(doc, site_url)
    
    # if !div["image"].nil?
    #       image_html = doc.css(div["image"] + " > img").first
    #       if !image_html.nil?
    #         parsed["image"] = get_image_src_from_text(image_html.to_html)
    #       end
    #     end
    #     if div["image"].nil? || image_html.nil?
    #       parsed["image"] = find_biggest_image(doc, feed_url)
    #     end
    
  
    return parsed
    
  end
  
  
  def self.tag_team_to_article (data)
    
    articles = Article.has_team
    
    if !articles.empty?
      lsi = Classifier::LSI.new
      articles.each{ |a|
        teams = a.team.collect(&:name)
        lsi.add_item a.tf_idf_content, *teams
      }
      result = lsi.classify data
      
      return Team.find_by_name(result.to_s).id
    else
      return nil
    end
  end
  
  
  def self.tag_team_to_article_bayes(this_article)
    
    articles = Article.has_team

    if !articles.empty?
      bayes = Classifier::Bayes.new
      
      Team.all.each do |team|
        bayes.add_category team.name
      end
      
      #train
      articles.each{ |a|
        a.team.each do |t|
          bayes.train t.name, a.tf_idf_content
        end
      } 
      
      #Classify
      result = bayes.classifications this_article.tf_idf_content
      result.sort_by{|k,v| -v}
      matched_teams = [ Team.find_by_name(result.keys[0].to_s).id,
                        Team.find_by_name(result.keys[1].to_s).id]
      
      
      this_article.team_ids = matched_teams
      
      
    end
    
  end
  
  
  def self.calculate_tf_idf
    articles = self.find(:all)
    reduced = Array.new
    articles.each{ |x|
      all_info = x.title + ' ' + x.title + ' ' + x.content # give a bit more boost to title

      # remove html tags
      all_info = CGI::unescapeHTML(all_info.gsub(/<\/?[^>]*>/, ""))
      
      reduced.push(all_info
        .greeklish.gsub(/[^a-z ]/i, ' ').gsub!(/ +/, ' ').downcase.split(' '))
    }
    
    a = TfIdf.new(reduced)
    tf_idf = a.tf_idf
    
    i = 0;
    tf_idf.each { |doc|
      id = articles[i].id
      result = ''
      doc.each { |term, freq|
        if Float(freq) > 0.004
          result = result + ' ' + term
        end
      }
      Article.update(id, {:tf_idf_content => result})
      i+=1
    }
    
  end
  
  
  def previous(offset = 0)    
      self.class.first(:conditions => ['id < ?', self.id], :limit => 1, :offset => offset, :order => "id DESC")
  end

  def next(offset = 0)
    self.class.first(:conditions => ['id > ?', self.id], :limit => 1, :offset => offset, :order => "id ASC")
  end
  

  def image_from_url(url)
    self.update_attribute(:image, open(url))
  end

  def self.get_image_src_from_text(text)
    text =~ /src=\"([^\"\s]+)\"/
    s = "#{$1}"
    return s
  end
  
  def self.find_biggest_image(doc, url)
    objective_function = 0
    main_image_url = nil
    doc.css("img").each do |img|
      src = add_site_url_to_link(img.attributes["src"].value, url)
      dim = FastImage.size(src)
      if !dim.nil? 
        aspect_ratio_gaussian = 2.72**(-( (dim[0]/dim[1]-1)**2 ) / 0.7)
        if aspect_ratio_gaussian < 0.25 #probably an ad
          next
        end
    
        if src.index(url) == nil #means is coming from other domain
          next
        end
        
        width_height = dim[0] + dim[1]
        if width_height > objective_function
          objective_function = width_height
          main_image_url = src
        end
      end
      
    end
    
    return main_image_url
    
  end
  
  def self.add_site_url_to_link(link, site_url)
    if link.index("http:") == nil
      link = site_url + link
    end
    
    link
    
  end
  
end
