# encoding: utf-8

class Article < ActiveRecord::Base
  
  belongs_to :feed
  belongs_to :organization
  has_and_belongs_to_many :teams
  
  
  def self.update_from_feed(feed_url)  
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
    feed.entries.each do |entry|  
      unless exists? :guid => entry.id  
        create!(  
          :title        => entry.title,  
          :summary      => entry.summary,
          :content      => entry.content,
          :url          => entry.url,  
          :published_at => entry.published,  
          :guid         => entry.id  
        )  
      end  
    end  
  end
  
  def self.update_all_feeds() 
    this_feed = Feed.find(5)
    #feeds.each do |this_feed|
      feedzir = Feedzirra::Feed.fetch_and_parse(this_feed.feed_url)  
      feedzir.entries.each do |entry|  
        unless exists? :guid => entry.id  
          create!(  
            :title        => entry.title,  
            :summary      => entry.summary,
            :content      => parse_div_content(entry.url, this_feed.content_unique_div),
            :url          => entry.url,  
            :published_at => entry.published,  
            :guid         => entry.id  
          )  
        end  
      end
    #end
  end
  
  def self.parse_div_content(url, div)
    Scraper::Base.parser :html_parser
    
    scraper = Scraper.define do
      array :items
      process div, :div_content => :text
      result :div_content
    end

    uri = URI.parse(url)
    return scraper.scrape(uri).force_encoding('UTF-8')
  end
  
  # def self.categorize_article_to_team (article)
  #   end
  
end
