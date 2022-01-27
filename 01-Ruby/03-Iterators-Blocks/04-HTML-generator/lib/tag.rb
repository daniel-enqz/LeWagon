def tag(tag_name, attributes = nil)
  if attributes.nil?
    "<#{tag_name}>#{yield}</#{tag_name}>"
  else
    "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">#{yield}</#{tag_name}>"
  end
end