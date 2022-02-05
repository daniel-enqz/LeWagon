require_relative 'cookbook'

class View
  def display(recipes)
    recipes.each do |recipe|
      puts "#{recipe.name}:\n.......#{recipe.description}"
    end
  end

  def ask_for(string)
    puts "What's the #{string}"
    gets.chomp
  end

  def ask_for_index
    puts "What's the number?"
    gets.chomp.to_i - 1
  end
end
