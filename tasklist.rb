require 'sinatra'
require './lib/create_schema.rb'
require './lib/database.rb'

class TaskList < Sinatra::Base
	get '/' do
		erb :index
	end

end