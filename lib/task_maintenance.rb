require 'sqlite3'

class Task_Maintenance
  attr_reader :db

  def initialize(dbname = "tasks")
    @db = SQLite3::Database.new "database/#{dbname}.db"
  end

  def add_task(task)
    puts "Preparing INSERT statements..."

    insert_task = <<-INSERTSTATEMENT
      INSERT INTO tasks (
        title, description, completed_at
      ) VALUES (
        :title, :description, :completed_at
      );
    INSERTSTATEMENT

    prepared_task = db.prepare(insert_task)
    prepared_task.execute(task)
  end

  def select_task

  end
end
