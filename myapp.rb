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

  post '/update' do
    erb :add
  end

  post '/add' do
    @my_hash = params["tasks"].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    TaskList::TaskQueries.new.insert_task(@my_hash)
    erb :add
    redirect '/'
  end

run!
end
