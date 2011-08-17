namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Comment, User].each(&:delete_all)
    
    Article.update_feeds
    
    
    
    User.populate 100 do |user|
      user.email     = Faker::Internet.email
      user.fullname  = Faker::Name.name
      user.avatar    = Populator.words(1)
      user.encrypted_password  = (0...8).map{65.+(rand(25)).chr}.join
    end
    
    Comment.populate 3800 do |comment|
      comment.title = Populator.words(1..5).titleize
      comment.body = Populator.words(1..80).capitalize
      comment.user_id = User.find(:first, :offset =>rand(99)).id
      comment.commentable_type = 'Article'
      comment.commentable_id = Article.random.id
    end
  end
end