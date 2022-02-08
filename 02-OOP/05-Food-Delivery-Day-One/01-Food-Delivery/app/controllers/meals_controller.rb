require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(repository)
    @repository = repository
    @view       = View.new
  end

  def add
    name = @view.ask_for("meal name?")
    price = @view.ask_for("meal price?").to_i
    new_meal = Meal.new(name: name, price: price)
    @repository.create(new_meal)
    # display_meal
  end

  def list
    all_meals = @repository.all
    @view.display(all_meals)
  end
end
