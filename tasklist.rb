require 'sinatra'
require_relative 'lib/task_maintenance'

class MyApp < Sinatra::Base

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
    erb :list_edit
  end

  get '/tasks/:id' do
    redirect '/'
  end

  put '/tasks/:id' do
    @my_edit = params[:id]
    @my_update = params["date"]
    @task = Task_Maintenance.get_entry(@my_edit)
    redirect '/'
  end
  # post '/delete/:id' do
  # if params.has_key?("ok")
  #   item = Item.first(:id => params[:id])
  #   item.destroy
  #   redirect '/'
  # else
  #   redirect '/'
  # end
# end


  run!
end
