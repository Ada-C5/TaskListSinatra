require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(dbname = "task_list")
      @db = SQLite3::Database.new("database/#{dbname}.db")
    end

    def setup!
      reset_schema!
      # load!
    end

    private

    def create_schema!
      query = <<-CREATESTATEMENT
        CREATE TABLE task_list (
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          completed_at TEXT,
          description TEXT,
        );
      CREATESTATEMENT

      @db.execute("DROP TABLE IF EXISTS task_list;")
      @db.execute(query) # runs one and only one query
    end

    # def load!
    #   insert_statement = <<-INSERTSTATEMENT
    #     INSERT INTO albums (
    #       label_code, artist, title, label, format, released, date_added
    #     ) VALUES (
    #     :label_code, :artist, :title, :label, :format, :released, :date_added
    #     );
    #   INSERTSTATEMENT
    #
    #   prepared_statement = @db.prepare(insert_statement)
    #
    #   CSV.foreach(FILE_PATH, headers: true) do |row|
    #     prepared_statement.execute(row.to_h)
    #   end
    # end
  end
end
