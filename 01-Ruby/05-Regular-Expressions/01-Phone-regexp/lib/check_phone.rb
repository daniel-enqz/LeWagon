def french_phone_number?(phone_number)
  # TODO: true or false
  phone_number.match?(/^(0|\+33\s-?)[1-9][\s-]?(\d{2}[\s-]?){4}$/)
end
