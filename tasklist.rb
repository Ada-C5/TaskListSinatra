require 'sinatra'
require './lib/database.rb'

class ToDoList < Sinatra::Base
	get '/' do
		@page_title = "Task List"
		@random = TaskList::ToDoItems.new
		@show = @random.show_all
		erb :index
	end

	get '/new_task' do
		@page_title = "New Task"
		erb :new_task
	end

	post '/new_task' do
		@page_title = "Task posted."
		# @title = params[:title]
		# @description = params[:description]
		# @completed_at = params[:completed_at]
		# @date_added = params[:date_added]
		@random = TaskList::ToDoItems.new
		@random.create_schema!
		@random.new_task!(params)
		redirect '/'
		erb :new_task
	end
	run!
end
