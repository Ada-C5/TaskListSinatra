require 'sqlite3'
require_relative 'database.rb'

class TaskHandler < TaskList::Database

  def initialize(dbname = "tasks")
    @db = SQLite3::Database.new("database/#{dbname}.db")
  end

  def list_all
   @db.execute("SELECT * FROM tasklist") #STILL WORKING
  end

  def create_task
    @db.execute("INSERT INTO tasklist (title, description, completed_at) VALUES (params[:title], params[:description], params[:completed_at])") #STILL WORKING
  end

  def find_task #STILL WORKING

  end

end

mytasks = TaskHandler.new
