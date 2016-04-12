require 'sinatra'
require_relative 'lib/database'


class TaskApp < Sinatra::Base

  get '/' do
    test_hash

    erb :index
  end


helpers do
  def test_hash
  test = {title: "BUY A DOZEN PUPPIES", description: "MOAR PUPPIES"}
  new_interaction = TaskList::Interaction.new
  new_interaction.create_task(test)
  end

end
  run!
end
