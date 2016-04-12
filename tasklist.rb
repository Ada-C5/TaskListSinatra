require 'sinatra'
require_relative 'lib/database'


class TaskApp < Sinatra::Base

  NEW_INTERACTION = TaskList::Interaction.new

  get '/' do
    erb :index
  end

  get '/create-task' do
    erb :create_task
  end

  post '/' do
    add_task(params)
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
