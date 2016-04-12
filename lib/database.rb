require "sqlite3"

module TaskList
  class Database

    def initialize(db_name)
      @db = SQLite3::Database.new(db_name)
    end

    def create_schema
      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.
      query = <<-CREATESTATEMENT
      CREATE TABLE todo (
      id INTEGER PRIMARY KEY,
      task TEXT NOT NULL,
      date_added TEXT,
      due_date TEXT,
      );
    	CREATESTATEMENT

    	@db.execute("DROP TABLE IF EXISTS todo;")
    	@db.execute(query)
    end
  end
end
