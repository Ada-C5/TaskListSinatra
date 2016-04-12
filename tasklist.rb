require 'sinatra'
require './lib/database.rb'

class ToDoList < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/' do
		@task = params[:task]
		@date_added = Time.now
		@due_date = params[:duedate]
		erb :index
	end
	run!
end
