require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/test' do
  test="test"
  "Hello #{test}"
end

get '/reload' do
  test="reload"
  "Hello #{test}"
end

get '/:name' do
	name = params[:name]
	"Hi there #{name}!"
end