require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(db_name= "tasks")
      @db = SQLite3::Database.new("database/#{db_name}.db")
    end

    def create_schema
    puts "Creating Schema..."

    query = <<-CREATESTATEMENT
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        completed_at TEXT
      );
      CREATESTATEMENT

      db.execute(query)
    end

    def reset_schema
      puts "Resetting schema..."
      db.execute("DROP TABLE IF EXISTS tasks;")
      create_schema
        # now that we have a prepared statement...
        # let's iterate the csv and use its values to populate our database
        # CSV.foreach(FILE_PATH, headers: true) do |row|
        #   prepared_statement.execute(row.to_h)
        # end

        # puts "Data import complete!"
      end
  end
end

TaskList::Database.new.create_schema
