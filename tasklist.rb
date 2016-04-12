require 'sinatra'
require './lib/database.rb'

class ToDoList < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/' do
		@task = 
		erb :index
	end
	run!
end