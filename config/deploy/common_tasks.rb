##
# Variables
#
set :rails_env, 'production'

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

  namespace :web do
    desc <<-DESC
      Present a maintenance page to visitors. Disables your application's web \
      interface by writing a "maintenance.html" file to each web server. The \
      servers must be configured to detect the presence of this file, and if \
      it is present, always display it instead of performing the request.
    DESC
    task :disable, :roles => :web, :except => { :no_release => true } do
      require 'erb'
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }

      template = File.read(File.join(File.dirname(__FILE__), "templates", "maintenance.rhtml"))
      result = ERB.new(template).result(binding)

      put result, "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end

end

# Clone from http://gist.github.com/318312 | created by leptom
# Directly copied from eycap-0.5.2 (thanks!)
#
# With these tasks you can:
#   - dump your production database and save it in shared_path/db_backups
#   - dump your production into your local database (clone_to_local)
#
# Right now is not tested without all the gem. Give me a moment to check it :-)
namespace :db do
  task :backup_name, :roles => :db, :only => { :primary => true } do
    now = Time.now
    run "mkdir -p #{shared_path}/db_backups"
    backup_time = [now.year, now.month, now.day, now.hour, now.min, now.sec].join('-')
    set :backup_file, "#{shared_path}/db_backups/#{rails_env}-snapshot-#{backup_time}.sql"
  end

  desc "Backup your MySQL or PostgreSQL database to shared_path+/db_backups"
  task :dump, :roles => :db, :only => {:primary => true} do
    backup_name
    run("cat #{shared_path}/config/database.yml") { |channel, stream, data| @environment_info = YAML.load(data)[rails_env] }
    dbuser = @environment_info['username']
    dbpass = @environment_info['password']
    environment_database = @environment_info['database']
    dbhost = @environment_info['host']

    if @environment_info['adapter'] == 'mysql'
      #dbhost = environment_dbhost.sub('-master', '') + '-replica' if dbhost != 'localhost' # added for Solo offering, which uses localhost
      run "mysqldump --add-drop-table -u #{dbuser} -h #{dbhost} -p #{environment_database} | bzip2 -c > #{backup_file}.bz2" do |ch, stream, out |
        ch.send_data "#{dbpass}\n" if out=~ /^Enter password:/
      end
    else
      run "pg_dump -W -c -U #{dbuser} -h #{dbhost} #{environment_database} | bzip2 -c > #{backup_file}.bz2" do |ch, stream, out |
        ch.send_data "#{dbpass}\n" if out=~ /^Password:/
      end
    end
  end

  desc "Sync your production database to your local workstation"
  task :clone_to_local, :roles => :db, :only => {:primary => true} do
    backup_name
    dump
    get "#{backup_file}.bz2", "/tmp/#{application}.sql.bz2"
    development_info = YAML.load_file("config/database.yml")['development']
    if development_info['adapter'] == 'mysql'
      run_str = "bzcat /tmp/#{application}.sql.bz2 | mysql -u #{development_info['username']} --password='#{development_info['password']}' -h #{development_info['host']} #{development_info['database']}"
    else
      run_str = "PGPASSWORD=#{development_info['password']} bzcat /tmp/#{application}.sql.bz2 | psql -U #{development_info['username']} -h #{development_info['host']} #{development_info['database']}"
    end
    %x!#{run_str}!
  end

end
