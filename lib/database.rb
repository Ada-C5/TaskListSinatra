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

  class Interaction < TaskList::Database
    attr_reader :db

    def create_task(hash)
      insert_statement = <<-INSERT
      INSERT INTO tasks (
      title, description, completed_at
      ) VALUES ( :title, :description, :completed_at);
      INSERT

      db.execute(insert_statement, hash)
    end

    def all_tasks
      query =<<-QUERY
        SELECT * FROM tasks;
      QUERY
      db.execute(query)
      # return an array
    end

  end
end
