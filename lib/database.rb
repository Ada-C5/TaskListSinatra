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
    attr_reader :zebra, :insert_statement

    def insert_task(hash)
      @insert_statement = <<-INSERTSTATEMENT
        INSERT INTO tasks(
          title, description, completed_at
        ) VALUES (
          :title, :description, :completed_at
        );
        INSERTSTATEMENT

        prepared_statement = @db.prepare(insert_statement)
        prepared_statement.execute(hash)

    end

    def update_task(hash)
       @db.execute <<-INSERTSTATEMENT
          UPDATE tasks
          SET title = '#{hash[:title]}',
           description = '#{hash[:description]}',
           completed_at = '#{hash[:completed_at]}'
          WHERE id = '#{hash[:id].to_i}';
          INSERTSTATEMENT

        @zebra = <<-INSERTSTATEMENT
          UPDATE tasks
          SET title = '#{hash[:title]}',
           description = '#{hash[:description]}',
           completed_at = '#{hash[:completed_at]}'
          WHERE id = '#{hash[:id].to_i}';
          INSERTSTATEMENT
    end

    def select_task
      @db.execute <<-HERE
      SELECT id, title, description, completed_at FROM tasks;
      HERE
    end

    def find_by_id(id_num)
      @db.execute <<-HERE
      SELECT id, title, description, completed_at
      FROM tasks
      WHERE id = #{id_num};
      HERE
    end

  end
end

#
# include inserting new tasks into the database,
# and selecting existing tasks from the database.
# TaskList::Database.new.create_schema

 # puts TaskList::TaskQueries.new.select_task
