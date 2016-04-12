class TaskList::Queries
  attr_reader :db
  def initialize(dbname = "task_list")
    @db = SQLite3::Database.new "databases/#{dbname}.db"
  end

end

class Tasks < TaskList::Queries

  def load!
    INSERT INTO tasks ( title, description,completed_at)

  end
end
