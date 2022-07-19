def load_stop_words(stop_words_filename)
  File.open(stop_words_filename, "r").map do |line|
    line.chomp
  end
end

def most_common_words(filename, stop_words_filename, number_of_word)
  counter = Hash.new(0)

  stop_words = load_stop_words(stop_words_filename)

  File.open(filename, "r").each_line do |line|
    line.chomp.downcase.split(/\W+/).each do |word|
      counter[word] += 1 unless stop_words.include? word
    end
  end

  counter.sort_by { |_, v| -v }[0..(number_of_word - 1)].to_h
end
