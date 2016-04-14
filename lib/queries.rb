require "sqlite3"


class TaskList::Queries
  attr_reader :db
  def initialize(dbname = "task_list")
    @db = SQLite3::Database.new "database/#{dbname}.db"
  end

end

class TaskList::TaskQueries < TaskList::Queries

  def load!(hash)
    statement = <<-STATEMENT
    INSERT INTO tasks (title, description,completed_at)
    VALUES (:title, :description, :completed_at);
    STATEMENT
    prepared_statement = @db.prepare(statement)
    @db.execute(statement, hash)

  end

  def display
    query = <<-DISPLAY
    SELECT *
    FROM tasks;
    DISPLAY
    @db.execute(query)
  end



  def delete(id)
    query = <<-DELETE
    DELETE FROM tasks
    WHERE id = ?;
    DELETE
      @db.execute(query,id)
  end

# def complete(completed_at)
#   query = <<-UPDATE
#   UPDATE FROM tasks
#   WHERE completed_at = ?;
#   UPDATE
#     @db.execute(query, completed_at)
#
# end

end
