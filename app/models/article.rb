require 'open-uri'


class Article < ActiveRecord::Base
  
  belongs_to :feed
  belongs_to :organization
  belongs_to :team
  
  acts_as_commentable
  
  named_scope :order_by, lambda { |*args| {:order => (args.first || 'id') } }
  named_scope :filter_by, lambda { |*args| {:conditions => (args.second.nil? || args.second.empty?) ? nil : [args.first + " = ?", args.second]} }
  
  def self.get_articles(params)
    case params[:order_by]
    when "popular"
      order_by = 'views'
    when "comments"
      order_by = 'comments'
    else
      order_by = 'id'
    end
    
    Article.order_by(order_by).filter_by('team_id', params[:team_id]).filter_by('organization_id', params[:organization_id])
  end
  
  def self.update_feeds() 
    the_feeds = Feed.find(:all)
    the_feeds.each do |this_feed|
      feedzir = Feedzirra::Feed.fetch_and_parse(this_feed.feed_url)  
      feedzir.entries.each do |entry|  
        unless exists? :url => entry.url
          parsed = parse_div_content2(entry.url, {'content' => this_feed.content_unique_div, 'category' => this_feed.category_unique_div, 'image' => this_feed.image_unique_div})
          if parsed["image"] != nil && parsed["image"].index("http:") == nil
            parsed["image"] = this_feed.site_url + parsed["image"]
          end
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
                             
          just_created = Article.last
          Article.update(just_created.id, 
            {:team_id => tag_team_to_article(just_created.title + ' ' + just_created.title + ' ' + just_created.content)}
            )
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
  
  def self.parse_div_content2(url, div)
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
      parsed["category"] = doc.css(div["category"]).first.content
    else
      parsed["category"] = nil
    end
    
    #image div
    if !div["category"].nil?
      parsed["image"] = get_image_src_from_text(doc.css(div["content"]).first.to_html)
    else
      parsed["image"] = nil
    end
   
    
    return parsed
    
    # doc.css(div).each do |result| 
    #       return result.to_html.force_encoding('utf-8')
    #       # array :items
    #       #       process div, :div_content => :text
    #       #       result :div_content
    #     end

  end
  
  
  def self.tag_team_to_article (data)
    
    articles = Article.find(:all, :conditions => "tf_idf_content IS NOT NULL AND team_id IS NOT NULL") 
    
    if !articles.empty?
      lsi = Classifier::LSI.new
      articles.each{ |a|
        lsi.add_item a.tf_idf_content, Team.find(a.team_id).name.to_sym
      }
      result = lsi.classify data
      
      return Team.find_by_name(result.to_s).id
    else
      return nil
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
  
  
  def self.get_image_src_from_text(text)
    text =~ /src=\"(.+)\"/
    s = "#{$1}";
    return s
  end
  
  
end
