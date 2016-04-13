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

	def completed_task(id)
		query = <<-QUERY
  	UPDATE tasks SET completed="COMPLETED" WHERE id = #{id};
  	FROM tasks;
  	QUERY

  	db.execute(query)
	end

end
