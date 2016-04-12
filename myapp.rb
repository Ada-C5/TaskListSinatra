#myapp

require 'sinatra'
require_relative 'lib/database.rb'


class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    @my_hash = params["tasks"].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    TaskList::TaskQueries.new.insert_task(@my_hash)
    erb :add
  end

run!
end
