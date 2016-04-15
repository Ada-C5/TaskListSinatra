require_relative 'database.rb'

class Tasks
  attr_reader :db

  def initialize(dbname = "task_list")
    @db = SQLite3::Database.new("database/#{dbname}.db")
    @task_list = TaskList::TaskRecord.new
  end

  def print_data
    @db.execute("SELECT * FROM task_list;")
  end

  def new_task(task)
    @task_list.new_task(task)
  end

  def find(text)

    query = <<-SEARCH
      SELECT * FROM task_list
      WHERE title LIKE "%#{ text }%"
      OR description LIKE "%#{ text }%"
      OR completed_at LIKE "%#{ text }%";
    SEARCH

    @db.execute(query)

  end

  def complete_task(id, current_status)

    # current_status = @db.execute("SELECT status FROM task_list WHERE id = #{ id };").first.first

    if current_status == "yes"
      check = "no"
    else
      check = "yes"
    end

    query = <<-COMPLETE
      UPDATE task_list SET status = "#{ check }" WHERE id = #{ id };
    COMPLETE

    @db.execute(query)

  end

  def delete_task(id)

    query = <<-DELETE
      DELETE FROM task_list WHERE id = #{ id };
    DELETE

    @db.execute(query)

  end

end
