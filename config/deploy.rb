set :application, 'TempleQuiz'
set :repo_url, 'git@github.com:mahcloud/LDSTempleQuiz.git'

set :scm, :git

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :rvm_type, :user
set :rvm_ruby_version, '2.1.2@TempleQuiz'

set :rails_env, 'production'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute "kill -USR2 `cat /home/deploy/TempleQuiz/current/tmp/pids/unicorn.pid`"
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
end
