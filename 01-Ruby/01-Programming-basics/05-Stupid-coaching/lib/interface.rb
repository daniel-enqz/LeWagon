require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

puts "Coach: Hey little pana..."
your_message = gets.chomp.to_s
while coach_answer_enhanced(your_message).nil? == false
  puts coach_answer_enhanced(your_message)
  your_message = gets.chomp.to_s
end
