require 'dm-core'
require 'dm-migrations'

class Tasks
	include DataMapper::Resource
	property :id, Serial
	property :name, String
	property :date, Date
	property :details, String
end

def date=date
    super Date.strptime(date, '%m/%d/%Y')
end

DataMapper.finalize

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