require 'sinatra'
require_relative 'lib/queries'

class TaskMaster < Sinatra::Base

  get "/" do
    erb :index
  end
  run!
end
