require 'sinatra'
require_relative 'lib/queries'

class TaskMaster < Sinatra::Base

  get "/" do
    erb :index
  end

  post "/" do
    @input = Queries.new.add_task(params[:task], params[:priority], "Not Started", "#{Time.now}", params[:due_date], params[:comments])
    erb :index
  end

  run!
end
