##
# Callbacks
#

#Enable/disable website when 'cap deploy'
# before "deploy:default", "deploy:web:disable"
# after "deploy:default", "deploy:web:enable"

# Create symlink to new release (used in 'cap deploy' task)
after "deploy:update", "deploy:config_files:do_symlinks"
after "deploy:update", "deploy:assets"

# Clean releases after deployment
after "deploy:migrations", "deploy:cleanup"
after "deploy:default", "deploy:cleanup"


# Tasks for mod_rails
#
namespace :mod_rails do
  task :start do ; end
  task :stop do ; end

  desc <<-DESC
  Restart the application altering tmp/restart.txt for mod_rails.
  DESC
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

	desc "Hard restart your passenger instances by killing the
dispatcher"
	task :hard_restart, :roles => :app, :except => {:no_release =>
		true} do
			restart
			run "pkill -f '^Rails: #{deploy_to}' || true"
			run "pkill -f '^Passenger ApplicationSpawner: #{deploy_to}' ||
true"
		end
end

# Deployment tasks
#
namespace :deploy do

  task :super_install do
    setup
    cold
  end

  %w(start restart).each { |name| task name, :roles => :app, :on_error => :continue do mod_rails.restart end }
  desc "It's a nop task with mod_rails."
  task :stop , :roles => :app do ; end

  desc <<-DESC
    Deploys and starts a `cold' application. This is useful if you have not \
    deployed your application before, or if your application is (for some \
    other reason) not currently running. It will deploy the code, run any \
    pending migrations, and then instead of invoking `deploy:restart', it will \
    invoke `deploy:start' to fire up the application servers.

    Modified by ASPgems: Creates yaml config files and assets directories
  DESC
  task :cold do
    update_code
    symlink
    config_files.default
    config_files.do_symlinks
    assets
    migrate
    start
  end

  desc <<-DESC
    Deploy and run pending migrations. This will work similarly to the \
    `deploy' task, but will also run any pending migrations (via the \
    `deploy:migrate' task) prior to updating the symlink. Note that the \
    update in this case it is not atomic, and transactions are not used, \
    because migrations are not guaranteed to be reversible.

    Modified by ASPgems: Migrations work under current_path, creates yaml config files and assets directories then run migrations.
  DESC
  task :migrations do
    set :migrate_target, :current
    web.disable
    update_code
    symlink 
    config_files.do_symlinks
    assets
    migrate
    restart
    web.enable
  end


  require 'erb'

  namespace :config_files do

    task :default, :roles => :app do
      config_files_array.each{|x|
        find_and_execute_task "deploy:config_files:"+File.basename(x).gsub(/\W/,"_")
      }
    end

    task :do_symlinks, :roles => :app do
      config_files_array.collect{|x|
        find_and_execute_task "deploy:config_files:symlink_#{File.basename(x).gsub(/\W/,"_")}"
      }
    end

    config_files_array.each {|full_path|
      file = File.basename(full_path)
      path = File.dirname(full_path)
      task_name = file.gsub(/\W/,"_")

      desc "Create #{file} file in shared_path"
      task task_name, :roles => :app do
        template = File.read(File.join(File.dirname(__FILE__), "templates", "#{file}.erb"))
        result = ERB.new(template).result(binding)

        run "mkdir -p #{shared_path}/config"
        put result, "#{shared_path}/config/#{file}"
      end

      desc "Make a symlink for #{file} from shared_path to current_path"
      task "symlink_#{task_name}" do
        run "ln -nfs #{shared_path}/config/#{file} #{current_path}/config/#{path}/#{file}"
      end

    }

  end

  desc <<-DESC
    Create assets directories in shared_path and link it to current_path.
  DESC
  task :assets do

    assets_array.each { |asset|
      run "mkdir -p #{shared_path}/assets/#{asset}"
      #TODO: Delete directory if exists
      run "ln -nfs #{shared_path}/assets/#{asset} #{current_path}/#{asset}"
    }

  end
end

