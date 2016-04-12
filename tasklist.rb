require 'sinatra'

class Tasklist < Sinatra::Base

  get '/' do
    @page_title = "Task List"
    erb :index
  end

  end

  run!
end
