require 'sinatra'
require_relative 'lib/database'
require_relative 'lib/queries'


class Tasks < Sinatra::Base
  get '/' do
    @create = TaskList::TaskQueries.new.display
    # @create.display
    erb :index
  end

  post '/' do
    @delete = TaskList::TaskQueries.new.delete(params[:id].to_i)
    erb :index
    redirect '/'
  end

# post '/' do
#   @complete = TaskList::TaskQueries.new.update(params[:completed_at])
#   erb :index
#   redirect '/'
# end

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
