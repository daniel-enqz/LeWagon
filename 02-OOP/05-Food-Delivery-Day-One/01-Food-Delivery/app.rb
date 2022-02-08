require 'require_all'
require_all 'app/repositories/**/*.rb'
require_all 'app/controllers/**/*.rb'
require_relative 'router'

csv_file       = File.join('data/', 'recipes.csv')
repository     = MealRepository.new(csv_file)
controller     = MealController.new(repository)

router = Router.new(controller)

# Start the app
#router.run
