def louchebemize(sentence)
  return sentence if sentence.length == 1

  final_sentence = []
  alphabet = ("a".."z").to_a
  sufix = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
  vowels_and_symbols = ["a", "e", "i", "o", "u", "!", " ", ","]
  sentence.split(/\b/).each do |word|
    word.concat(word[0]) && word[0] = "" until vowels_and_symbols.include? word[0]
    word.concat(sufix.sample) && word.prepend("l") if alphabet.include? word[0]
    final_sentence << word
  end.join
end

louchebemize("chat, fou!!")
