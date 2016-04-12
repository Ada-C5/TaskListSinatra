require 'sinatra'
require_relative 'lib/database'
require_relative 'lib/queries'


class Tasks < Sinatra::Base
  get '/' do
    @title = params["title"]
    @description = params["description"]
    @completed_at = params["completed_at"]
    erb :index
  end

  get'/create_task' do
    erb :create_task
  end

  post'/create_task' do
    @create = TaskList::TaskQueries.new
    @create.load!(params)
    erb :create_task
  end
  run!
end
