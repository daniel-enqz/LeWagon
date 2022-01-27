def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  number = number.to_s.chars.map(&:to_i)
  if number.size == 1
    true
  else
    # Multiply all numbers inside the array and store them in num
    num = number.inject(:*)
    # Multiply subsequent index
    arr = []
    number.each_with_index do |n, index|
      arr << (n[index] * n[index + 1])
    end
    print arr
    print number
    if number.uniq.size == number.size
      true
    else
      number << num
      print number
      number.uniq.size == number.size
    end
  end
end
puts colorful?(236)
