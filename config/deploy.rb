# RVM bootstrap
ENV['rvm_path']||="~/.rvm"
$:.unshift(File.expand_path("~/.rvm/lib"))
# require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2p290'
set :rvm_type, :user

# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "goalara"
role :web, "goalara.com"
role :app, "goalara.com"
role :db,  "goalara.com", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/srv/www/goalara.com/goalara"
set :deploy_via, :remote_cache
set :user, "root"
set :use_sudo, true

# repo details
set :scm, :git
set :scm_username, "panayi"
set :repository, "git@github.com:panayi/goalara.git"
set :branch, "master"
set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'