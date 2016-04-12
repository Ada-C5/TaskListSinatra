require "sqlite3"

module TaskList
  class Database

    def initialize(db_name)
      @db = SQLite3::Database.new(db_name)
    end

    def create_schema
      query = <<-CREATESTATEMENT
        CREATE TABLE albums (
          id INTEGER PRIMARY KEY,
          done_or_not NUMERIC,
          task TEXT NOT NULL,
          due_date TEXT,
        );
      CREATESTATEMENT
    end
  end
end
