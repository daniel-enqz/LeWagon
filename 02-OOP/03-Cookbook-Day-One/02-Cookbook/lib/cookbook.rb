require "pry-byebug"
require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def update
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    update
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update
  end
end
