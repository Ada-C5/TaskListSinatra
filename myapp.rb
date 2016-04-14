#myapp

require 'sinatra'
require_relative 'lib/database.rb'


class MyApp < Sinatra::Base

  get '/' do
    @entire_list = TaskList::TaskQueries.new.select_task
    erb :index
  end

# BUT WHY!?!??!?!
  # post '/' do
  #   @entire_list = TaskList::TaskQueries.new.select_task
  #   erb :index
  # end

  get '/add' do
    erb :add
  end

  post '/update/:id' do
    @id = params.keys[0].to_i
    @task = TaskList::TaskQueries.new.find_by_id(@id).flatten
    #pull correct task from databse based on @id
    # find_by_id(id_num)
    erb :update
  end

  post '/update' do
    # @new_params = params
    @other_hash = params["tasks"].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    x = TaskList::TaskQueries.new
    x.update_task(@other_hash)
    @zebra = x.zebra
    erb :updated
  end


  post '/add' do
    @my_hash = params["tasks"].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    TaskList::TaskQueries.new.insert_task(@my_hash)
    erb :add
    redirect '/'
  end

run!
end
