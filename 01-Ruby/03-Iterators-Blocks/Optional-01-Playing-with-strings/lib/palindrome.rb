require "pry-byebug"
def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  a_string.downcase.gsub(/[^a-z0-9]/, "") == a_string.downcase.gsub(/[^a-z0-9]/, "").reverse
end
