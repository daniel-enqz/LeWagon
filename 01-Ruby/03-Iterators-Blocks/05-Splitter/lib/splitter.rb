def size_splitter(array, size)
  sorted_array = []
  sorted_array << array.select { |element| element.length == size }
  sorted_array << array.select { |element| element.length > size || element.length < size }
  sorted_array.each { |x| x.sort! }
  p sorted_array
end

def block_splitter(beatles)
  p_beatles = []
  other_beatles = []
  result = []
  beatles.each_with_index do |_nil, i|
    p_beatles.push(beatles[i]) if yield(beatles[i])
    other_beatles.push(beatles[i]) if yield(beatles[i]) == false
  end
  result << p_beatles << other_beatles
end
