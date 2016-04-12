require 'sinatra'
require './lib/database.rb'

class ToDoList < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/' do
		new = TaskList::ToDoItems.new
		new.create_schema!
		@title = params[:task]
		@description = params[:description]
		@date_added = Time.now
		@completed_at = params[:completed_at]
		erb :index
	end
	run!
end
