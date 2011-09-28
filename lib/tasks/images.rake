namespace :db do
  desc "Remove images that belong to articles older than 2 weeks"
  task :remove_old_images do
    window = Time.now - 2*7*24*60*60
    
    articles = Article.published_since(window);
    
    articles.each do |article|
      article.image = nil
      article.save
    end
    
  end
end