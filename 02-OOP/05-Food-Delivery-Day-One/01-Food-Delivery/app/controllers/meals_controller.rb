require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(repository)
    @repository       = repository
    @meals_view       = MealsView.new
  end

  def list
    all_meals = @repository.all
    @meals_view.display(all_meals)
  end

  def add
    name = @meals_view.ask_for("meal name?")
    price = @meals_view.ask_for("meal price?").to_i
    new_meal = Meal.new(name: name, price: price)
    @repository.create(new_meal)
    list
  end

  def edit; end

  def delete
    list
    index = @meals_view.ask_for_index
    @repository.remove(index)
    list
  end
end
