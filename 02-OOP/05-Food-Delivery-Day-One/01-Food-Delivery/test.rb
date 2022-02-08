require_relative 'app/repositories/meal_repository'
require_relative 'app/models/meal'

csv_path = 'data/meals.csv'
repo = MealRepository.new(csv_path)
meal = Meal.new
repo.create()
