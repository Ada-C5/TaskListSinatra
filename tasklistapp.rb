require 'sinatra'
require_relative 'lib/task_handler.rb'

class Tasklistapp < Sinatra::Base

  mytasks = TaskHandler.new

  get '/' do
    erb :index
  end

  post '/' do
    @task_info = params["task"]
    mytasks.create_task(@task_info)
    erb :index
  end

  get '/addtask' do
    erb :addtask
  end

run!
end
