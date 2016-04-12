require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(db_name = "tasklist")
      @db = SQLite3::Database.new "database/#{db_name}.db"
    end

    def create_schema
      puts "Creating schema!!"

      query = <<-CREATESTATEMENT
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY,
          task TEXT NOT NULL,
          priority TEXT,
          status TEXT DEFAULT 'Not Started',
          date_created TEXT',
          due_date TEXT,
          comments BLOB
        );
      CREATESTATEMENT

      db.execute('DROP TABLE IF EXISTS tasks;')
      db.execute(query)
    end
  end
end
 TaskList::Database.new.create_schema
