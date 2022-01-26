def wagon_sort(students)
  students.sort_by { |name| name[0].downcase}
  return students
end