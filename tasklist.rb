require 'sinatra'
require './lib/database.rb'

class ToDoList < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/' do
		@title = params[:title]
		@description = params[:description]
		@date_added = Time.now
		@completed_at = params[:completed_at]
		@random = TaskList::ToDoItems.new
		@random.create_schema!
		@random.new_task!(params)
		erb :index
	end
	run!
end
