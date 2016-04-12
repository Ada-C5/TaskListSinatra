require 'Sinatra'

class TaskList < Sinatra::Base
	get '/' do
		erb :index
	end

	get '/newtask' do
		erb :newtask
	end


end
