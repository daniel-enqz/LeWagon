require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view     = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    recipe_name = @view.ask_for("name")
    recipe_description = @view.ask_for("description")
    new_recipe = Recipe.new(recipe_name, recipe_description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    recipes = @cookbook.all
    @view.display(recipes)
    recipe_index = @view.ask_for_index
    @cookbook.remove_recipe(recipe_index)
  end
end
