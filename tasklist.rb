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

	erb :completed

	end

	post '/completed' do
		@primary_keyy = params['completed_check'].to_i
		erb :completed

	end
	run!
end
