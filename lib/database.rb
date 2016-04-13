require "sqlite3"

module TaskList
  class Database

    def initialize(dbname = "tasks")
      @db = SQLite3::Database.new("database/#{dbname}.db")
    end

    def create_schema
      query = <<-CREATESTATEMENT
      CREATE TABLE tasklist (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      description TEXT,
      completed_at TEXT
      );
      CREATESTATEMENT

      @db.execute("DROP TABLE IF EXISTS tasklist;")
      @db.execute(query)
    end

  end
end

TaskList::Database.new.create_schema
