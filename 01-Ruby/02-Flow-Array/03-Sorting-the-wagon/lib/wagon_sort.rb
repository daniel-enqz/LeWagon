def wagon_sort(students)
  return students.sort_by! { |name| name[0].downcase }
end
