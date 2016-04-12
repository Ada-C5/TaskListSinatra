require 'sqlite3'
require_relative 'database.rb'

class TaskHandler < TaskList::Database
attr_accessor :db

  def initialize(dbname = "tasks")
    @db = SQLite3::Database.new("database/#{dbname}.db")
  end

  def list_all
   @db.execute("SELECT * FROM tasklist;") #STILL WORKING
  end

  def create_task(task_info)
    @db.execute("INSERT INTO tasklist (title, description, completed_at)
    VALUES (:title, :description, :completed_at);", task_info)
     #STILL WORKING
  end

  def find_task #STILL WORKING

  end

end
