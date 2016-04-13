require 'sinatra'
require_relative 'lib/queries'
require 'chronic'

class TaskMaster < Sinatra::Base

  get "/" do
    @all_tasks = Queries.new.display_tasks
    erb :index
  end

  post "/delete" do
    @delete = Queries.new.delete_task(params[:task_id].to_i)
    redirect '/'
  end

  get "/add" do
    erb :add
  end


  post "/" do
    @input = Queries.new.add_task(params[:task], params[:priority], "Not Started", "#{Time.now}", "#{Chronic.parse(params[:due_date])}", params[:comments])
    @all_tasks = Queries.new.display_tasks
    erb :index
  end

  run!
end
