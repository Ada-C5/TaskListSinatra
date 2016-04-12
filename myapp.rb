#myapp

require 'sinatra'
require_relative 'lib/database.rb'


class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

run!
end
