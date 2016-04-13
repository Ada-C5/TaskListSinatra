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

end
