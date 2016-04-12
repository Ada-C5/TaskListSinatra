require 'sqlite3'
require_relative 'database'

class Queries < TaskList::Database
  attr_reader :db

  def initialize(db_name = "tasklist")
    @db = SQLite3::Database.new "database/#{db_name}.db"
  end

  def add_task(task, priority, status, date_created, due_date, comments)
    query = <<-QUERY
    INSERT INTO tasks (task, priority, status, date_created, due_date, comments)
    VALUES (?, ?, ?, ?, ?, ?);
    QUERY
    db.execute(query, task, priority, status, date_created, due_date, comments)
  end

  def select_by_due_date(direction) #asc or desc
    query = <<-QUERY
      SELECT * FROM tasks
      ORDER BY due_date ?;
    QUERY

    db.execute(query, "#{direction}")

  end

  def select_by_date_created(direction) #asc or desc
  end


  def select_by_priority(level) #either put high or low
  end

  def select_by_status(level) #not started, in progress, completed
  end



end
