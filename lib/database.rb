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
    id INTEGER PRIMARY KEY,
    title  TEXT NOT NULL,
    description TEXT,
    completed_at TEXT

    );

    CREATSTATEMENT
    @db.execute("DROP TABLE IF EXISTS tasks;")
    @db.execute(query)

    end

  end

end


# task_db = TaskList::Database.new this will reset the database
# task_db.create_schema
