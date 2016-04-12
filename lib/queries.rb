require 'sqlite3'
require 'csv'
require_relative 'database.rb'

class Queries < TaskList::TaskDatabase

  def show_all_tasks
  	query = <<-QUERY

  	SELECT title, description, completed
  	FROM tasks; 
  	QUERY

  	db.execute(query)

 		puts " Test #{query} "
  end

end

test = Queries.new
test.show_all_tasks