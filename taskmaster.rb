require 'sinatra'
require_relative 'lib/queries'
require 'chronic'
require 'rainbow/ext/string'

class TaskMaster < Sinatra::Base

  get "/" do
    @all_tasks = Queries.new.display_tasks

    erb :index
  end

  get "/add" do
    erb :add
  end


  post "/add" do
    unless params[:due_date] == ""
      params[:due_date] = "#{Chronic.parse(params[:due_date]).strftime("%m/%d/%Y at %I:%M%p")}"
    end
    @input = Queries.new.add_task(params[:task], params[:priority], "Not Started", "#{Time.now.strftime("%m/%d/%Y at %I:%M%p")}", params[:due_date], params[:comments])
    @all_tasks = Queries.new.display_tasks
    redirect '/'
  end


  post "/delete" do
    @delete = Queries.new.delete_task(params[:task_id].to_i)
    redirect '/'
  end

  get "/edit" do
    @find_task = Queries.new.find_task(params[:task_id].to_i).first
    erb :edit
  end

  post "/edit" do
    unless params[:due_date] == ""
      params[:due_date] = "#{Chronic.parse(params[:due_date]).strftime("%m/%d/%Y at %I:%M%p")}"
    end
    if params[:status] == "Completed"
      params[:date_completed] = "#{Time.now.strftime("%m/%d/%Y at %I:%M%p")}"
    else
      params[:status]
    end
    @input = Queries.new.update_task(params[:task], params[:priority], params[:status], params[:due_date], params[:comments], params[:date_completed], params[:task_id].to_i)
    @all_tasks = Queries.new.display_tasks
    redirect '/'
  end




  run!
end
