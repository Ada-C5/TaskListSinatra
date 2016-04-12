require 'sinatra'
#require_relative 'lib/'

class Tasklistapp < Sinatra::Base


  get '/' do
    erb :index
  end

end
