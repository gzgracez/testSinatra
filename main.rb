require 'rubygems'
require 'sinatra'
require 'erb'
require 'sass'
require 'sinatra/reloader' if development?
require './tasks'

#get('/styles.css'){ scss :styles, :syntax => :scss, :style => :compressed }

get '/' do
  @title = "testSinatra's Home Page!"
  erb :home
end

get '/tasks' do
  @title="All Tasks"
  @tasks = Tasks.all
  puts "Tasks" + @tasks.inspect
  erb :tasks
end

get '/tasks/new' do
  @title="New Task"
  @tasks = Tasks.new
  erb :new_tasks
end

post '/tasks' do
  tasks = Tasks.create(params[:tasks])
  redirect to("/tasks/#{tasks.id}")
end

get '/tasks/:id' do
  @title = Tasks.get(params[:id]).name
  @tasks = Tasks.get(params[:id])
  erb :show_tasks
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
  erb :not_found, :layout => false
end

#get '/:name' do
#	name = params[:name]
#	"Hi there #{name}!"
#end
