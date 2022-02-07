require "pry-byebug"

def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  hash = {}
  counter = 0
  File.open(file_name, "r").each_line do |line|
    line.split.each do |word|
      return 0 if stop_words_file_name.include? word

      hash[word] = 1
    end
  end
  hash
end

p most_common_words("source-text.txt", "stop_words.txt", 3)
