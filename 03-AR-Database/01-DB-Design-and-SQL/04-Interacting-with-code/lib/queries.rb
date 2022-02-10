require 'sqlite3'
require 'pry-byebug'

def artist_count(db)
  results = db.execute("SELECT COUNT(*) FROM artists")
  return results[0].join.to_i
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  results = db.execute("SELECT COUNT(*) FROM #{table_name}")
  return results[0].join.to_i
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  results = db.execute("SELECT name FROM artists ORDER BY name ASC")
  return results.flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  results = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'")
  return results.flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  results = db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length * 60_000} ORDER BY milliseconds ASC")
  return results.flatten
end

min_length = 45
db = SQLite3::Database.new("lib/db/jukebox.sqlite")
p long_tracks(db, min_length)
