require 'sqlite3'

class Schema
  attr_reader :db

  def initialize(dbname = "tasklist")
    @db = SQLite3::Database.new "database/#{dbname}.db"
  end

  def reset_schema!
    puts "Creating schema!!"

    query = <<-CREATESTATEMENT
    CREATE TABLE tasks (
    id INTEGER PRIMARY KEY,
    task TEXT NOT NULL,
    priority TEXT,
    status TEXT,
    date_created TEXT,
    due_date TEXT,
    comments BLOB
    );
    CREATESTATEMENT

    db.execute('DROP TABLE IF EXISTS tasks;')
    db.execute(query)

  end

end

Schema.new.reset_schema!
