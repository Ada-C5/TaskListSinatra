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
    db.execute <<-QUERY
    SELECT *
    FROM tasks;
    QUERY
  end

  def update_entry(title, description, date, id)
    query = <<-QUERY
    UPDATE tasks
    SET title = ?, description = ?, completed_at = ?
    WHERE id = ?
    ;
    QUERY

    db.execute(query, title, description, date, id)
  end

  def get_entry(id)
    query = <<-QUERY
    SELECT *
    FROM tasks
    WHERE id = ?
    ;
    QUERY
    db.execute(query, id)
  end

  def delete_task(id)
    query = <<-QUERY
    DELETE
    FROM tasks
    WHERE id = ?
    ;
    QUERY
    db.execute(query, id)
  end

end
