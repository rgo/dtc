set :application, "dtc"
set :repository,  "git://github.com/rgo/dtc.git"
set :user, application
ssh_options[:config] = false
set :use_sudo, false
set :keep_releases, 2
set :rails_env, "production"
set :latest_tag, ""

set(:scm_username) { Capistrano::CLI.ui.ask("Type is your svn username: ") }
set(:scm_password){ Capistrano::CLI.password_prompt("Type your svn password for user #{scm_username}: ") }

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/app"

role :app, "megatron.aspgems.com"
role :web, "megatron.aspgems.com"
role :db,  "megatron.aspgems.com", :primary => true

config_files=%w(database.yml sphinx.yml)
initializers=%w()
dirs=%w(config)
after "deploy:update_code","deploy:symlink_config"
after "deploy:setup","deploy:create_dirs"
after "deploy:symlink_config","deploy:symlink_initializers"

after "deploy","deploy:cleanup"
# Here comes the app config

namespace :deploy do

  task :symlink_config, :roles => :app do
    config_files.each do |f|
      run "ln -nfs #{shared_path}/config/#{f} #{release_path}/config/#{f}"
    end
  end

  task :symlink_initializers, :roles => :app do
    initializers.each do |f|
      run "ln -nfs #{shared_path}/config/#{f} #{release_path}/config/initializers/#{f}"
    end
  end

  task :restart, :roles => :app do
    run "touch  #{current_path}/tmp/restart.txt"
  end

  task :create_dirs, :roles => :app do
    dirs.each do |d|
      run "mkdir -p #{shared_path}/#{d}"
    end
  end

  desc "Enables maintenance mode in the app"
  task :maintenance_on, :roles => :app do
    run "cp #{shared_path}/system/maintenance.html.disabled #{current_path}/public/system/maintenance.html"
  end

  desc "Disables maintenance mode in the app"
  task :maintenance_off, :roles => :app do
    run "rm #{shared_path}/system/maintenance.html"
  end
end

# Here comes the application namespace for custom tasks

namespace application do

end

# Bundler tasks for new applications
# after "deploy:symlink_initializers", "bundler:bundle"
namespace :bundler do
  task :bundle, :roles => :app do
    run "cd #{release_path} && bundle lock"
  end

  task :bundle_new_release do
    run "cd #{current_path} && bundle install"
  end
end
