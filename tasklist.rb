require 'sinatra'
require_relative 'lib/database.rb'

class Tasklist < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/tasks' do
    erb :tasks
  end

  post '/tasks' do
    # database = TaskList::Database.new

    @new_task = params["task_hash"]
    task_list = TaskList::TaskRecord.new
    task_list.new_task(@new_task)

    @all_tasks = task_list.print_data
    erb :tasks
  end

  run!
end
