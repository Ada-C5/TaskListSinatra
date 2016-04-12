require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(db_name = "database")
      @db = SQLite3::Database.new "database/#{db_name}.db"
    end

    def create_schema
    query = <<-CREATESTATEMENT
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        completed_at TEXT
      );
    CREATESTATEMENT

    db.execute("DROP TABLE IF EXISTS tasks;")
    db.execute(query)
    end
  end
end
TaskList::Database.new.create_schema