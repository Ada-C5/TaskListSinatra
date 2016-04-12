require 'sinatra'
require_relative './lib/database'

class Tasklist < Sinatra::Base

  get '/' do
    @page_title = "Task List"
    erb :index
  end

  post '/' do

    database = TaskList::Database.new

    new_task = params["task_hash"]

    task_list = TaskList::TaskRecord.new

    task_list.new_task(new_task)

    erb :index
  end

  run!
end
