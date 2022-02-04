require_relative 'cookbook'

class View
  def display(recipes)
    recipes.each do |recipe|
      puts recipe.name.to_s
    end
  end
end
