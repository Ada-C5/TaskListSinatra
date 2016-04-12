require 'sinatra'
require_relative 'lib/task_handler.rb'

class Tasklistapp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/index' do

  end

run!
end
