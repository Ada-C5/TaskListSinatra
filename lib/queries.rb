require "sqlite3"


class TaskList::Queries
  attr_reader :db
  def initialize(dbname = "task_list")
    @db = SQLite3::Database.new "databases/#{dbname}.db"
  end

end

class TaskQueries < TaskList::Queries

  def load!(hash)
    statement = <<-STATEMENT
    INSERT INTO tasks (title, description,completed_at)
    VALUES (:title, :description, :completed_at);
    STATEMENT
    @db.execute(statement, hash)

  end

  def display
    query = <<-DISPLAY
    SELECT *
    FROM tasks;
    DISPLAY
    @db.execute(query)
  end
end
