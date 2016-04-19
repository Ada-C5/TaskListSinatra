require 'sqlite3'
require_relative 'database'
require 'chronic'
require 'rainbow/ext/string'

class Queries < TaskList::Database
  attr_reader :db

  def initialize(db_name = "tasklist")
    @db = SQLite3::Database.new "database/#{db_name}.db"
  end

  def display_tasks
    db.execute("select * from tasks;")
  end

  def add_task(task, priority, status, date_created, due_date, comments)
    query = <<-QUERY
    INSERT INTO tasks (task, priority, status, date_created, due_date, comments)
    VALUES (?, ?, ?, ?, ?, ?);
    QUERY
    db.execute(query, task, priority, status, date_created, due_date, comments)
  end

  def find_task(id)
    db.execute("SELECT * FROM tasks WHERE id = ?", id)
  end

  def update_task(task, priority, status, due_date, comments, date_completed, id)
    query = <<-QUERY
    UPDATE tasks SET task = ?, priority = ?, status = ?, due_date = ?, comments = ?, date_completed = ?
    WHERE id = ?;
    QUERY
    db.execute(query, task, priority, status, due_date, comments, date_completed, id)
  end

  def sort_by_due_date(direction) #asc or desc
    query = <<-QUERY
      SELECT * FROM tasks
      ORDER BY due_date ?;
    QUERY
    db.execute(query, "#{direction}")
  end

  def delete_task(id)
    db.execute("DELETE FROM tasks WHERE id = ?;", id)
  end

  def sort(field, direction) #asc or desc
    db.execute("select * from tasks ORDER BY #{field} #{direction};")
  end
end
