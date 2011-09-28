# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end


set :environment, :development

set :output, "/log/whenever.log"
every 30.minutes do
  runner "Article.update_feeds", environment => "development"
end

every :thursday, :at => '3am' do 
  command "rm -rf #{RAILS_ROOT}/log/whenever.log"
  runner "Article.train", environment => "development"
end

every 2.weeks do
  rake "db:remove_old_images" 
end

# Learn more: http://github.com/javan/whenever
