require "sqlite3"

module TaskList
  class Database

    def initialize(db_name)
    	# Connects to the database
      @db = SQLite3::Database.new(db_name)
    end

    private

    def create_schema
    		query = <<-QUERY
    			CREATE TABLE tasks (
    				id INTEGER PRIMARY KEY,
    				title TEXT NOT NULL,
    				description TEXT,
    				completed TEXT
    			);
    		QUERY
    		@db.execute(query)
    end
  end
end
