require "sqlite3"
require 'tilt/erb'

module TaskList
  class Database
    attr_reader :db
    def initialize(db_name="todo")
      @db = SQLite3::Database.new("todo.db")
    end

    def create_schema!
      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.
      todo = <<-CREATESTATEMENT
      CREATE TABLE IF NOT EXISTS todo (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      description TEXT,
      date_added TEXT,
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
  			title, description, date_added, completed_at
  		) VALUES (
  			:title, :description, :date_added, :completed_at
  		);
  		INSERTSTATEMENT
      # OrderDate datetime NOT NULL DEFAULT GETDATE()

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
  end
end
