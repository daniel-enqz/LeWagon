def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  return false if a_string.length <= 1

  a_string.downcase.gsub(/[^a-z0-9]/, "") == a_string.downcase.gsub(/[^a-z0-9]/, "").reverse
end
