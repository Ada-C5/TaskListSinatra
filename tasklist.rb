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

  post '/' do
    add_task(params)
    @all_tasks = NEW_INTERACTION.all_tasks
    erb :index
  end


helpers do
  def add_task(hash)
  # test = {title: "BUY A DOZEN PUPPIES", description: "MOAR PUPPIES"}
    NEW_INTERACTION.create_task(hash)
  end

end
  run!
end
