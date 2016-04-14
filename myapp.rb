require 'sinatra'
require_relative 'lib/database.rb'


class MyApp < Sinatra::Base

  get '/' do
    @entire_list = TaskList::TaskQueries.new.select_task
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/delete/:id' do
    @id = params.keys[0].to_i
    @task = TaskList::TaskQueries.new.delete_task(@id).flatten
    redirect '/'
  end

  post '/update/:id' do
    @id = params.keys[0].to_i
    @task = TaskList::TaskQueries.new.find_by_id(@id).flatten
    erb :update
  end

  post '/update' do
    @other_hash = params["tasks"].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    TaskList::TaskQueries.new.update_task(@other_hash)
    redirect '/'
  end

  post '/add' do
    @my_hash = params["tasks"].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    TaskList::TaskQueries.new.insert_task(@my_hash)
    erb :add
    redirect '/'
  end

run!
end
