set :application, "qdxinghao"
role :app, application
role :web, application
role :db,  application, :primary => true

set :user, "leomayleomay"
set :deploy_to, "/home/leomayleomay/web/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "/home/hao/Repository/xinghai.git"
set :branch, "master"

namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  # desc "Symlink shared configs and folders on each release."
  # task :symlink_shared do
  #   run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  # end
end
