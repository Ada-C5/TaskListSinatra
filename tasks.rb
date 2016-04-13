require 'sinatra'
require_relative 'lib/database'
require_relative 'lib/queries'


class Tasks < Sinatra::Base
  get '/' do
    @create = TaskList::TaskQueries.new.display
    @create.display
    erb :index
  end

  get '/create_task' do
    erb :create_task
  end

  post '/create_task' do
    @create = TaskList::TaskQueries.new.load!(params)
    erb :create_task
    redirect '/'
  end
  run!
end
