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

  class TaskQueries < Database
    def insert_task(hash)
      insert_statement = <<-INSERTSTATEMENT
        INSERT INTO tasks(
          title, description, completed_at
        ) VALUES (
          :title, :description, :completed_at
        );
        INSERTSTATEMENT

        prepared_statement = @db.prepare(insert_statement)
        prepared_statement.execute(hash)

    end

    

    def select_task
      @db.execute <<-HERE
      SELECT * FROM tasks;
      HERE
    end
  end
end

#
# include inserting new tasks into the database,
# and selecting existing tasks from the database.
# TaskList::Database.new.create_schema
 puts TaskList::TaskQueries.new.select_task
