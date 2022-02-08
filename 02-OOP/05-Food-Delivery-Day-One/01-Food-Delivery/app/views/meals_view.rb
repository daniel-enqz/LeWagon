require_relative '../repositories/meal_repository'
require 'pry-byebug'

class View
  def display(all_meals)
    all_meals.each do |meal|
      puts meal.name
    end
  end

  def ask_for(string)
    puts "What's the #{string}"
    print ">"
    gets.chomp
  end
end
