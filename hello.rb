require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader' if development?
#set :port, 5000

get '/hello' do
  "Hello Sinatra!"
end

get '/' do
  "Home"
end

get '/test' do
  test="test"
  "Hello #{test}"
end

get '/reload' do
  test="reload"
  "Hello #{test}"
end