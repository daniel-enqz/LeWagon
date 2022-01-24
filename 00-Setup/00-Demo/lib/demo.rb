def circle_area(radius)
  pi = 3.14
  if radius.positive?
    area = pi * radius**2
    return area
  else
    return 0
  end
end

puts circle_area(1)
