# config.ru

require './app'
$stdout.sync = true
run Sinatra::Application
