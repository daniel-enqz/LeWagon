def array_to_hash(array)
  hash = {}
  if block_given? 
    array.each_with_index { |value, index| hash[yield(index)] = value }
  else
    array.each_with_index { |value, index| hash[index.to_s] = value }
  end
  return hash
end
