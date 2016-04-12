require 'Sinatra'
require_relative 'lib/database.rb'
class Task < Sinatra::Base

	get '/' do
		erb :index
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
