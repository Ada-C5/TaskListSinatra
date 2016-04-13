require 'sinatra'
require_relative 'lib/database'
require_relative 'lib/queries'


class Tasks < Sinatra::Base
  get '/' do
    erb :index
  end

  # post '/' do
  #   # @display = TaskList::TaskQueries.new
  #   @create.display
  # end

  get '/create_task' do
    erb :create_task
  end

  post '/create_task' do
    @create = TaskList::TaskQueries.new
    @create.load!(params)
    erb :create_task
    redirect '/'
  end
  run!
end
