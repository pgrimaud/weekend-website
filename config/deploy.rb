# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'weekend'
set :repo_url, 'git@github.com:ternel/weekend-website.git'

# Default branch is :master
#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
def tag_branch_target
  tags = `git tag`.split("\n")
  tag_prompt = "#{tags.reverse[(0..5)]}"
  ask :branch_or_tag, tag_prompt
  tag = fetch(:branch_or_tag)
  tag.match(/^\d/).nil? ? tags.last : tag
end


set :branch, proc { tag_branch_target }

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/home/ternel/www/weekend'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

SSHKit.config.command_map[:composer] = "php /home/ternel/www/weekend/shared/composer.phar"
