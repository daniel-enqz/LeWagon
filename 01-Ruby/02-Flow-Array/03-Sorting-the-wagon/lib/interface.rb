require_relative "wagon_sort"
students = []
puts "Type a student name:"
student = gets.chomp
students << student

while student != ""
  puts "Type another student name or press enter to finish:"
  student = gets.chomp
  students << student
end

students.pop
wagon_sort(students)


if students.length == 1
  puts "1 student"
  puts wagon_sort(students)
else
  sentence = students[0..-2].join(", ")
  puts sentence
  sentence += " and #{students.last}"
  puts "Congratulations! Your Wagon has #{students.size} students:"
  puts sentence
end
