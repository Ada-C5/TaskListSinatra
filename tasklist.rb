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
    elsif params["search"]
    # find task
      search = params["text"]
      @search_results = @tasks.find(search)
    end
    @all_tasks = @tasks.print_data
    erb :tasks
  end

  run!
end
