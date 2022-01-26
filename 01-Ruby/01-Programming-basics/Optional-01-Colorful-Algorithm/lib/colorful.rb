def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  number = number.to_s.chars.map(&:to_i)

  # Multiply subsequent index
  for i in (0...number.size - 1) do
    num = number[i] * number[i + 1]
    number << num
  end
  
  # Multiply all numbers
  num = number.each { |x| x * (x + 1) }
  number << num

  # Logic Sequence
  return number.uniq.size == number.size ? true : false
end

puts colorful?(234)
