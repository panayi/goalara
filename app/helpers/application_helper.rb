require 'open-uri'

module ApplicationHelper
  def words_occurrences_in_string(text)
    words = text.split 
    freqs=Hash.new(0) 
    words.each { |word| freqs[word] += 1 } 
    freqs.sort_by {|x,y| y }.reverse.each {|w, f| puts w+' '+f.to_s}
  end
  
  def truncate_words(text, length, end_string = ' ...')
    returning words = text.split() do
      words = words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
    end
  end
  
  def remove_http(text)
    text.gsub('http://', '');
  end
  
  
  def get_user_avatar(user)
    #TODO: add team column to user. Set css classes for no-image border according to the team's color
    if !user.avatar.blank?
      if File.exist?("/images/users/" + user.avatar.to_s)
        exists = true
      end
    else
        exists = false
    end
      
      exists ? "/images/users/" + user.avatar.to_s : "/images/no_image.png"
  end


  def shorten (string, count = 250)
  	if string.length >= count 
  		shortened = string[0, count]
  		splitted = shortened.split(/\s/)
  		words = splitted.length
  		splitted[0, words-1].join(" ") + ' ...'
  	else 
  		string
  	end
  end
  
  def user_team_logo(user)
    result = ""
    if(!user.team.nil?)
      result = team_logo(user.team.logo_image)
    end
  
    result
    
  end
  
  
  def team_logo(filename, html_class = '')
    return image_tag("teams/converted/" + filename, :class => html_class)
  end
  
  def feed_logo(filename, html_class = '')
     return image_tag("feeds/converted/" + filename, :class => html_class)
  end
  
  def article_image(article, logo)
    if !article.image_file_name.nil?
      image_tag(article.image.url(:medium))
    else
      feed_logo(logo)
    end
  end
  
  
  def get_facebook_page_likes(fb_page_url)
    result = ActiveSupport::JSON.decode(open(fb_page_url))
  
    result["likes"]
  end
  
  def article_url(article)
    return "/news#" + article.id.to_s() + "/" + remove_http(article.url)
  end
  
  def get_article_teams_ids(article)
    result = ""
    teams = []
    if !article.team.empty?
      article.team.each do |team|
        teams.push(team.id.to_s())
      end
      result = teams.join("_")
    end
    
    result
  end
  
  def format_datetime_for_sort(datetime)    
    return datetime.delete("-:\sUTC")
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
end