class SessionsView
  def ask_for(string)
    puts "What's the #{string}"
    print ">"
    gets.chomp
  end

  def greet(employee)
    puts "Welcome, #{employee}!"
  end

  def login_error
    puts "Password or Username incorrect"
  end
end
