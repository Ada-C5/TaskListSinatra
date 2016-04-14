require 'sinatra'
# require_relative 'lib/database.rb'
require_relative 'lib/tasks.rb'


class Tasklist < Sinatra::Base


  get '/' do
    erb :index
  end


  get '/tasks' do
    @tasks = Tasks.new
    @all_tasks = @tasks.print_data
    erb :tasks
  end


  post '/tasks' do
    @tasks = Tasks.new

    if params["add_task"]
    # create new task
      @new_task = params["task_hash"]
      @tasks.new_task(@new_task)
    end
    if params["search"]
    # find task
      search = params["text"]
    end
      @search_results = @tasks.find(search)
    if params["completed"]
      task_completed = params["completed"]
      @tasks.complete_task(task_completed.to_i)
    end
    if params["delete"]
      task_deleted = params["delete"]
      @tasks.delete_task(task_deleted.to_i)
    end
    @all_tasks = @tasks.print_data
    erb :tasks
  end

  run!
end
