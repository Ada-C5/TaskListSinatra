require "sqlite3"

module TaskList
  class Database

    def initialize(db_name)
      @db = SQLite3::Database.new(db_name)
    end

    def create_schema
      query = <<-CREATESTATEMENT
        CREATE TABLE task_list (
          id INTEGER PRIMARY KEY,
          done_or_not NUMERIC,
          task TEXT NOT NULL,
          due_date TEXT,
        );
      CREATESTATEMENT

      @db.execute("DROP TABLE IF EXISTS task_list;")
      @db.execute(query)
    end
  end
end
