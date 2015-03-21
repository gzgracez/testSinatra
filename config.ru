require './main'
run Sinatra::Application
Slim::Engine.set_default_options pretty: true if development?