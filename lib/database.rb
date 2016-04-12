require "sqlite3"

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
      CREATE TABLE todo (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      description TEXT,
      date_added TEXT,
      completed_at TEXT,
      );
    	CREATESTATEMENT

    	# @db.execute("DROP TABLE IF EXISTS todo;")
    	@db.execute(todo)
    end
  end

  class ToDoItems < Database

  	def initialize
  		super
  	end

  	def new_task!(title, description = nil, date_added = nil, completed_at =nil)
  		task= <<-INSERTSTATEMENT
  		INSERT INTO todo(
  			title, description, date_added, completed_at
  		) VALUES (
  			:title, :description, :date_added, :completed_at
  		);
  		INSERTSTATEMENT
  	end
  end
end
