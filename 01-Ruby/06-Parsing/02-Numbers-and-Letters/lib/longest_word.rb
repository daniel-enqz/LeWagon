require 'open-uri'
require 'json'
require 'pry-byebug'
# if attempt.chars.all? {|letter| attempt.count(letter) <= grid.count(letter)}

def generate_grid(grid_size)
  range = ("A".."Z").to_a
  string = []
  grid_size.times {string.push(range.sample)}
  string
end

def score_calculator(length, elapsed)
  score = length
  if elapsed < score
    score - elapsed
  elsif elapsed > score
  end
end

def run_game(attempt, grid, start_time, end_time)
  hash = {score: 0, message: "", time: end_time - start_time }
#--------------------------------------------------------
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)
#--------------------------------------------------------
  if user["found"] == true && attempt.chars.all? {|letter| attempt.count(letter) <= grid.count(letter.upcase)}
    hash[:score] = (score_calculator(user["length"], hash[:time]))
    hash[:message] = "well done"
  else
    if user["found"] == false
      hash[:message] = "not an english word"
    elsif attempt.chars.all? {|letter| attempt.count(letter) <= grid.count(letter.upcase)} == false
      hash[:message] = "not in the grid"
    end
  end
hash
end
