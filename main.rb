require 'rubygems'
require 'sinatra'
require 'slim'
require 'sass'
require 'sinatra/reloader' if development?

get '/' do
  @title = "testSinatra's Home Page!"
  slim :home
end

get '/test' do
  @title="testSinatra's Test Page"
  test="test"
  "Hello #{test}"
  slim :test
end

get '/reload' do
  @title="testSinatra's Reload Page"
  test="reload"
  "Hello #{test}"
  slim :reload
end

not_found do
  @title="404 Error"
  slim :not_found
end

#get '/:name' do
#	name = params[:name]
#	"Hi there #{name}!"
#end
