require_relative "wagon_sort"
i = 0
students = []
while i < 3
    puts "Type another student name or press enter to finish:"
    student = gets.chomp
    students << student
    i += 1
end
print wagon_sort(students)
