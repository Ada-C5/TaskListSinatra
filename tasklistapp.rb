require 'sinatra'
require_relative 'lib/task_handler.rb'

class Tasklistapp < Sinatra::Base

  mytasks = TaskHandler.new

  get '/' do
    erb :index
  end

  post '/' do
    if params["task"] != nil
      @task_info = params["task"]
      mytasks.create_task(@task_info)
    end

    if params["done_ids"] != nil
      @done_ids = params["done_ids"]
      mytasks.complete_task(@done_ids)
    end

    erb :index
  end


  get '/addtask' do
    erb :addtask
  end

  run!
end
