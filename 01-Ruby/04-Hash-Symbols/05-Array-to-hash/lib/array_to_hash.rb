def array_to_hash(array)
  hash = {}
  if block_given? # call it passing the array index and use what’s returned as the hash key.
    array.each_with_index { |value, index| hash[yield(index)] = value }
  else # then the hash keys should just be the indexes of the elements in the array, converted as String.
    array.each_with_index { |value, index| hash[index.to_s] = value }
  end
  return hash
end
