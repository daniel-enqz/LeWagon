def colorful?(number)
  number = number.to_s.chars.map(&:to_i)
  return true if number.size == 1

  if number.size == 2
    number << number.inject(:*)
    return number.uniq.size == number.size
  end
  num = number.inject(:*)
  arr = []
  number.each_with_index { |_n, index| arr << (number[index] * number[index + 1] if index < number.size - 1) }
  arr.each_with_index { |n, _index| number << n unless nil? }
  number << num
  number.uniq.size == number.size
end
