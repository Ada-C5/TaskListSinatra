require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(db_name="tasklist")
      @db = SQLite3::Database.new("database/#{db_name}.db")
    end

    def create_schema
      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.
      create_query =<<-QUERY
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          description TEXT,
          completed_at TEXT
        );
      QUERY

      db.execute("DROP TABLE IF EXISTS tasks;")
      db.execute(create_query)
    end
  end
end

task_db = TaskList::Database.new

task_db.create_schema
