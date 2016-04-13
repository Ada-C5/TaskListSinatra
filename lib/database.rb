require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(db_name="task_list")
      @db = SQLite3::Database.new "database/#{db_name}.db"
    end

    def create_schema

    query = <<-CREATSTATEMENT
    CREATE TABLE tasks(
    id INTERGER PRIMARY KEY,
    title  TEXT NOT NULL,
    description TEXT,
    completed_at TEXT

    );

    CREATSTATEMENT
    @db.execute("DROP TABLE IF EXISTS tasks;")
    @db.execute(query)

      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.
    end

  end

end


release_db = TaskList::Database.new
release_db.create_schema
