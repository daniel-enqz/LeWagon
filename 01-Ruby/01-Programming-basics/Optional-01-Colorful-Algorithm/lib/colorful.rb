def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  for i in (0...number.size-1) do
    num = number[i].to_i * number[i+1].to_i
    number << num
  end

  i = 0
  num = number[i].to_i * number[i+1].to_i * number[i+2].to_i
  number << num

  if number.map(&:to_i).uniq.size < number.size
    return false   
  else
    return true
  end
end

number = gets.chomp
puts colorful?(number.split(""))

