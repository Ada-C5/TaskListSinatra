require 'sqlite3'
require_relative 'database'

class Queries < TaskList::Database
  attr_reader :db

  def initialize(db_name = "tasklist")
    @db = SQLite3::Database.new "database/#{db_name}.db"
  end

  def add_task
    
  end

end
