def sum_odd_indexed(array)
  # TODO: computes the sum of elements at odd indexes (1, 3, 5, 7, etc.)
  #       You should use Enumerable#each_with_index
  array.each_with_index do |_number, index|
    array.delete_at(index) if array[index].even?
  end
  array.sum
end

def even_numbers(array)
  # TODO: Return the even numbers from a list of integers.
  #       You should use Enumerable#select
  array.select { |element| element.even? } # => [0, 3, 6, 9]
end

def short_words(array, max_length)
  array.reject { |word| word.length > max_length }
  # TODO: Take an array of words, return the array of words not exceeding max_length characters
  #       You should use Enumerable#reject
end

def first_under(array, limit)
  array.find { |word| word < limit }
  # TODO: Return the first number from an array that is less than limit.
  #       You should use Enumerable#find
end

def add_bang(array)
  array.map { |word| word.concat("!") }
  # TODO: Take an array of strings and return a new array with "!" appended to each string.
  #       You should use Enumerable#map
end

def concatenate(array)
  array.inject(:+)
  # TODO: Concatenate all strings given in the array.
  #       You should use of Enumerable#reduce
end

def sorted_pairs(array)
  a = []
  array.each_slice(2) { |tuple| a.push(tuple) }
  a.each { |words| words.sort! }
end
