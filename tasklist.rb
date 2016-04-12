require 'sinatra'
require_relative 'lib/task_maintenance'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/first_form' do
    erb :first_form
  end

  post '/first_form' do
    @my_task = Task_Maintenance.new
    @form_info = params["task"]
    @my_task.add_task(@form_info)
    erb :first_form
  end

  run!
end
