require "sqlite3"
require 'tilt/erb'

module TaskList
  class Database
    attr_reader :db
    def initialize(db_name="todo")
      @db = SQLite3::Database.new("todo.db")
    end

    def create_schema!
      todo = <<-CREATESTATEMENT
      CREATE TABLE IF NOT EXISTS todo (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      description TEXT,
      date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      completed_at TEXT
      );
    	CREATESTATEMENT

    	@db.execute(todo)
    end
  end

  class ToDoItems < Database

  	def initialize
  		super
  	end


  	def new_task!(params)
  		task= <<-INSERTSTATEMENT
  		INSERT INTO todo(
  			title, description, completed_at
  		) VALUES (
  			:title, :description, :completed_at
  		);
  		INSERTSTATEMENT

  		prepared = @db.prepare(task)
  		prepared.execute(params)
  	end

    def show_all
      all = <<-STATEMENT
      SELECT *
      FROM todo;
      STATEMENT

      @db.execute(all)
    end

    def delete_row(row_id)
    	delete = <<-STATEMENT
      DELETE FROM todo
      WHERE id = #{row_id};
      STATEMENT

      @db.execute(delete)
    end

    def mark_complete(row_id)
      complete = <<-STATEMENT
      UPDATE todo
      SET completed_at = 1
      WHERE id = #{row_id};
      STATEMENT

      @db.execute(complete)
    end
  end
end
