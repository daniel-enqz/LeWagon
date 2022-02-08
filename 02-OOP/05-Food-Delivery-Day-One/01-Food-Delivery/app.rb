require 'require_all'
require 'app/repositories/**/*'
require 'app/controllers/**/*'
require_relative 'router'

csv_file       = File.join('data/', 'recipes.csv')
repository     = MealRepository.new(csv_file)
controller     = MealsController.new(repository)

router = Router.new(controller)

# Start the app
# router.run
