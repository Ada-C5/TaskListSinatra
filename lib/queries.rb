require 'sqlite3'
require 'csv'
require_relative 'database.rb'

class Queries
	attr_reader :db

	def initialize(dbname = "tasks")
	  # This does NOT make a new database. It connects TO the database
	  @db = SQLite3::Database.new "database/#{dbname}.db"
	end
  def show_all_tasks
  	query = <<-QUERY

  	SELECT id, title, description, completed
  	FROM tasks;
  	QUERY

  	db.execute(query)
  end

# This is broken, how to make the query do the thing 
	def completed_task(id)
		query =
  	"UPDATE tasks SET completed=\"COMPLETED\" WHERE id =" + #{id} + ";" 

  	db.execute(query)
	end

  def show_completed_tasks
    query = <<-QUERY

    SELECT id, title, description, completed
    FROM tasks
    WHERE completed = 'COMPLETED';
    QUERY

    db.execute(query)

  end 

end
