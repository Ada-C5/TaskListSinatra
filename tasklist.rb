require 'sinatra'
require_relative 'lib/database'


class TaskApp < Sinatra::Base

  NEW_INTERACTION = TaskList::Interaction.new

  get '/' do
    @all_tasks = NEW_INTERACTION.all_tasks
    erb :index
  end

  get '/create-task' do
    erb :create_task
  end

  get '/create-task/:number' do
    id = params["number"]
    @edit_task = NEW_INTERACTION.find_task(id)
    erb :create_task
  end

  post '/' do
    add_task(params)
    @all_tasks = NEW_INTERACTION.all_tasks
    erb :index
  end

  post '/:number' do
    id = params["number"]
    @updated_task = NEW_INTERACTION.update_task(params[:title], params[:description], id)
    redirect to('/')
  end

  get '/delete-task/:number' do #Should be a destructive method, we dunno how
    @all_tasks = NEW_INTERACTION.all_tasks
    id = params["number"]
    NEW_INTERACTION.delete(id)
    redirect to('/')
  end

  get '/completed/:number' do
    id = params["number"]
    NEW_INTERACTION.completed(id)
    redirect to('/')
  end

  get '/uncompleted/:number' do
    id = params["number"]
    NEW_INTERACTION.uncompleted(id)
    redirect to('/')
  end

helpers do
  def add_task(hash)
  # test = {title: "BUY A DOZEN PUPPIES", description: "MOAR PUPPIES"}
    NEW_INTERACTION.create_task(hash)
  end

end
  run!
end
