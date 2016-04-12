require "sqlite3"

module TaskList
  class Database

    def initialize(db_name = "tasks")
      @db = SQLite3::Database.new("database/#{db_name}.db")
    end

    def create_schema!
      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.
      query = <<-CREATESSTATEMENT
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          description TEXT,
          completed_at TEXT
        );
        CREATESSTATEMENT

        @db.execute("DROP TABLE IF EXISTS tasks;")
        @db.execute(query)
    end

  #   def load!
  #   puts "Preparing INSERT statements..."
  #
  #   insert_statement = <<-INSERTSTATEMENT
  #     INSERT INTO albums (
  #       title, description, completed_at
  #     ) VALUES (
  #       :title, :description, :completed_at
  #     );
  #   INSERTSTATEMENT
  #
  #   prepared_statement = db.prepare(insert_statement)
  #
  #   # now that we have a prepared statement...
  #   # let's iterate the csv and use its values to populate our database
  #   # WE DONT HAVE A CSV YET.. !!!!!!!!!!!!!!!!!!!!!!!!!
  #   CSV.foreach(FILE_PATH, headers: true) do |row|
  #     prepared_statement.execute(row.to_h)
  #   end
  #
  #   puts "Data import complete!"
  # end

  end
end

TaskList::Database.new.create_schema!
