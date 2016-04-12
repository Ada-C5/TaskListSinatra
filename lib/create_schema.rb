require_relative 'database'

task_db = TaskList::Database.new
task_db.create_schema
