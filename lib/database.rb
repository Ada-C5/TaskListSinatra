require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(db_name)
      @db = SQLite3::Database.new(db_name)
    end

    def create_schema
    puts "Creating Schema..."

    query = <<-CREATESTATEMENT
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        completed_at TEXT,
      );
      CREATESTATEMENT

      db.execute("DROP TABLE IF EXISTS albums;")
      db.execute(query)
    end

    def load!
        puts "Preparing INSERT statements..."

        insert_statement = <<-INSERTSTATEMENT
          INSERT INTO tasks (
            id, title, description, completed_at
          ) VALUES (
            :id, :title, :description, :completed_at
          );
        INSERTSTATEMENT

        prepared_statement = db.prepare(insert_statement)

        # now that we have a prepared statement...
        # let's iterate the csv and use its values to populate our database
        # CSV.foreach(FILE_PATH, headers: true) do |row|
        #   prepared_statement.execute(row.to_h)
        # end

        # puts "Data import complete!"
      end
  end
end
