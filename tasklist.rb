require 'Sinatra'
require 'SQLite3'
require_relative 'lib/database.rb'
require_relative 'lib/queries.rb'
class Task < Sinatra::Base

	get '/' do
		erb :index
	end

	post '/' do
		@feeding = TaskList::TaskDatabase.new.load!(params)
		erb :index
	end

	get '/newtask' do
		erb :newtask
	end

	post '/newtask' do

		erb :index

	end

	get '/completed' do
		@show_completed
	erb :completed
	end

	post '/completed' do
		@get_completed = Queries.new.completed_task(params[:completed_check].to_i)
		@show_completed = Queries.new.show_completed_tasks
		erb :completed

	end

	get '/deleted' do
		erb :deleted
	end

	post '/deleted' do
		@get_deleted = Queries.new.deleted_task(params[:deleted_check].to_i)
		erb :completed
	end


	run!
end
