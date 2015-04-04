require 'rubygems'
require 'sinatra'
require 'erb'
require 'sass'
require 'sinatra/reloader' if development?
require './tasks'

#get('/styles.css'){ scss :styles, :syntax => :scss, :style => :compressed }

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

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
  erb :not_found, :layout => false
end


get '/tasks' do
  @title="All Tasks"
  @tasks = Tasks.all
  erb :tasks
end

get '/tasks/new' do
  @title="New Task"
  @tasks = Tasks.new
  erb :new_task
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

get '/tasks/:id/edit' do
  @title = "Edit " + Tasks.get(params[:id]).name
  @tasks=Tasks.get(params[:id])
  erb :edit_task
end

put '/tasks/:id' do
  @title = "Update " + Tasks.get(params[:id]).name
  tasks=Tasks.get(params[:id])
  tasks.update(params[:tasks])
  redirect to("/tasks/#{tasks.id}")
end

delete '/tasks/:id' do
  @title = "Delete " + Tasks.get(params[:id]).name
  Tasks.get(params[:id]).destroy
  redirect to("/tasks")
end

helpers do
  def current?(path='/')
    (request.path==path || request.path==path+'/') ? "current" : nil
  end
end

#get '/:name' do
#	name = params[:name]
#	"Hi there #{name}!"
#end
