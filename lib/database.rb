require "sqlite3"

module TaskList
  class Database

    def initialize(db_name="todo")
      @db = SQLite3::Database.new("todo.db")
    end

    def create_schema
      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.
      todo = <<-CREATESTATEMENT
      CREATE TABLE todo (
      id INTEGER PRIMARY KEY,
      task TEXT NOT NULL,
      date_added TEXT,
      due_date TEXT,
      );
    	CREATESTATEMENT

    	@db.execute("DROP TABLE IF EXISTS todo;")
    	@db.execute(todo)
    end
  end

  class ToDoItems < Database

  	def initialize
  		super
  	end

  	def new_task!
  		task= <<-INSERTSTATEMENT
  		INSERT INTO todo(
  			task, date_added, due_date
  		) VALUES (
  			:task, :date_added, :due_date
  		);
  		INSERTSTATEMENT
  	end
  end
end
