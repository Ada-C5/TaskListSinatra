require "sqlite3"

module TaskList
  class TaskDatabase
    attr_reader :db

    def initialize(db_name = "tasks")
    	# Connects to the database
      @db = SQLite3::Database.new "database/#{db_name}.db"
    end

    # def setup
    #   create_schema
    #   load!(hash)
    # end


    def create_schema
      puts "Preparing table"

    	query = <<-QUERY
    		CREATE TABLE tasks (
    			id INTEGER PRIMARY KEY,
    			title TEXT NOT NULL,
    			description TEXT,
    			completed TEXT
    		);
    	QUERY
      db.execute("DROP TABLE IF EXISTS tasks;")
    	db.execute(query)

      puts "Table creation completed!"

    end

    def load!(hash)
        puts "Preparing INSERT statements"
        insert_statement = <<-QUERY
            INSERT INTO tasks (title, description, completed)
            VALUES (:title, :description, :completed)
            ;
        QUERY
        prepared_statement = db.prepare(insert_statement)

        prepared_statement.execute(hash)

        puts "Data import complete!"
    end
  end
end

# test = TaskList::TaskDatabase.new
# test.create_schema
