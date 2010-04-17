set :application, "dtc"
set :repository,  "git://github.com/rgo/dtc.git"

set :user, "dtc"
set :use_sudo, false


set :scm, :git
set :deploy_to, "/home/#{user}/app/"
set :branch, "master"

set :deploy_via, :remote_cache

##
# Database access data variables
#
set :database_server, "localhost"
set :database_username, "dtc"
set (:database_password){ Capistrano::CLI.password_prompt("Database password: ") }
set :database_name_dev, "dtc_dev"
set :database_name_test, "dtc_test"
set :database_name_prd, "dtc_production"

##
# Config_files & asset directories
#
set :config_files_array, %w(database.yml)
set :assets_array, []

role :web, "vapor.aspgems.com"                          # Your HTTP server, Apache/etc
role :app, "vapor.aspgems.com"                          # This may be the same as your `Web` server
role :db,  "vapor.aspgems.com", :primary => true # This is where Rails migrations will run
role :db,  "vapor.aspgems.com"

load 'config/deploy/common_tasks.rb'
