require 'sinatra'
require_relative 'lib/queries'

class TaskMaster < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/add" do
    erb :add
  end


  post "/" do
    @input = Queries.new.add_task(params[:task], params[:priority], "Not Started", "#{Time.now}", params[:due_date], params[:comments])
    # puts "#{@input}"
    @all_tasks = Queries.new.display_tasks
    erb :index
  end

  run!
end
