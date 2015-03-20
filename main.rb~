require 'rubygems'
require 'sinatra'
require 'sass'
require 'sinatra/reloader' if development?

get '/' do
  @title = "testSinatra's Home Page!"
  erb :home
end

get '/test' do
  @title="testSinatra's Test Page"
  test="test"
  "Hello #{test}"
  erb :test
end

get '/reload' do
  @title="testSinatra's Reload Page"
  test="reload"
  "Hello #{test}"
  erb :reload
end

not_found do
  @title="404 Error"
  erb :not_found
end

#get '/:name' do
#	name = params[:name]
#	"Hi there #{name}!"
#end
