require 'require_all'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

csv_file         = File.join('data/', 'meals.csv')
repository       = MealRepository.new(csv_file)
meals_controller = MealsController.new(repository)

csv_file             = File.join('data/', 'customers.csv')
repository           = CustomerRepository.new(csv_file)
customers_controller = CustomersController.new(repository)

router = Router.new(meals_controller, customers_controller)
router.run
