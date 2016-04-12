require 'sqlite3'

class TaskHandler < TaskList::Database

  def initialize(dbname = "tasks")
    @db = SQLite3::Database.new("database/#{dbname}.db")
  end

  def create_task

  end

  def find_task

  end

end
