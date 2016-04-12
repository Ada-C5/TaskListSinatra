require 'sinatra'


class Tasks < Sinatra::Base
  get '/' do
    erb :index
  end

  get'/create_task' do
    erb :create_task
  end


  post'/create_task' do
    erb :create_task
  end
  run!
end
