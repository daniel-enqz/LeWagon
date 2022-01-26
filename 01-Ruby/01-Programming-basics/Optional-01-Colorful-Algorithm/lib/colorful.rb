def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  number = number.to_s.chars.map(&:to_i)
  if number.size == 1
    true
  else
    # Multiply all numbers inside the array and store them in num
    arr = number
    num = arr.inject(:*)
    # Multiply subsequent index
    number.each_index do |i|
      product = number[i] * number[i + 1]
      number << product
    end
    if number.uniq.size == number.size
      true
    else
      number << num
      print number
      number.uniq.size == number.size
    end
  end
end

puts colorful?(23)
