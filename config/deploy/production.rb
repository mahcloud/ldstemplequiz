set :stage, :production

set :deploy_to, '/home/deploy/TempleQuiz'

server '104.131.216.47', user: 'deploy', roles: %w{web app db}
