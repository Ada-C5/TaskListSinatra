require 'sinatra'


class Scrabble < Sinatra::Base
  get '/' do
    erb :index
  end
end
