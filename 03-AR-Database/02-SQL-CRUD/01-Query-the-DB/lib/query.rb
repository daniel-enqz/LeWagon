require 'sqlite3'

def all_artists(db)
  # TODO: use `db` to execute an SQL query against the database to
  # retrieve all columns from all records from the `artists` table.
  rows = db.execute('SELECT * FROM artists')
  return rows
end

# DB = SQLite3::Database.new("a_file.db")
# rows = DB.execute('SELECT * FROM table_name')
