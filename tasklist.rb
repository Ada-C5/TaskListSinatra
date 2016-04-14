require 'sinatra'
require './lib/database.rb'

class ToDoList < Sinatra::Base
	get '/' do
		@page_title = "Task List"
		@random = TaskList::ToDoItems.new
		@random.create_schema!
		@show = @random.show_all
		erb :index
	end

	post '/' do
		@page_title = "Task List"
		@random = TaskList::ToDoItems.new
		@random.create_schema!
		@random.delete_row(params[:id].to_i)
		@random.mark_complete(params[:mark].to_i)
		@show= @random.show_all
		erb :index
	end

	get '/new_task' do
		@page_title = "New Task"
		erb :new_task
	end

	post '/new_task' do
		@page_title = "Task posted."
		@random = TaskList::ToDoItems.new
		@random.create_schema!
		@random.new_task!(params)
		redirect '/'
		erb :new_task
	end
	run!
end
