def sum_with_for(min, max)
  if min > max
    return -1
  else
    sum = 0
    # CONSTRAINT: you should use a for..end structure
    for i in (min..max)
      sum += i
    end
    return sum
  end
end

def sum_with_while(min, max)
  if min > max
    return -1
  else
    sum = 0
    while min <= max
      sum += min
      min += 1
    end
    return sum
  end
end

sum_with_for(1, 5)
sum_with_while(2, 5)
