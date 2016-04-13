require 'Sinatra'
require 'SQLite3'
require_relative 'lib/database.rb'
require_relative 'lib/queries.rb'
class Task < Sinatra::Base

	get '/' do
		erb :index
	end

	post '/' do 

	end 

	get '/newtask' do
		erb :newtask
	end

	post '/newtask' do
		@feeding = TaskList::TaskDatabase.new.load!(params)

		erb :index

	end
	run!
end
