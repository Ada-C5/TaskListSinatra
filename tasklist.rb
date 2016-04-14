require 'sinatra'
require_relative 'lib/task_maintenance'

class MyApp < Sinatra::Base
  set :method_override, true

  get '/' do
    @my_task = Task_Maintenance.new
    @results = @my_task.select_task
    erb :index
  end

  get '/first_form' do
    erb :first_form
  end

  post '/first_form' do
    @my_task = Task_Maintenance.new
    @form_info = params["task"]
    @my_task.add_task(@form_info)
    # erb :first_form
    redirect '/'
  end

  get '/tasks/edit/:id' do
    @my_edit = params[:id]
    @entry = Task_Maintenance.new
    @current = @entry.get_entry(@my_edit)
    erb :list_edit
  end

  get '/tasks/:id' do
    redirect '/'
  end

  put '/tasks/:id' do
    @my_edit = params[:id]
    @my_title = params["title"]
    @my_description = params["task"]["description"]
    @my_update = params["date"]
    @my_request = Task_Maintenance.new
    @my_request.update_entry(@my_title, @my_description, @my_update, @my_edit)
    redirect '/'
  end

  delete '/tasks/:id' do
    @my_edit = params[:id]
    @my_request = Task_Maintenance.new
    @my_request.delete_task(@my_edit)
    redirect '/'
  end


  run!
end
