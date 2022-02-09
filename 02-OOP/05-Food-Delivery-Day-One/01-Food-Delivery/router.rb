# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller     = meals_controller
    @customers_controller = customers_controller
    @running              = true
  end

  def run
    puts "Welcome to FoodDelivery!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.delete
    when 5 then @customers_controller.add
    when 6 then @customers_controller.list
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.delete
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6, 7, 8 or 0"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts "What do you want to do next?"
    puts "1 - Add new meal"
    puts "2 - List all meals"
    puts "3 - Edit a meal"
    puts "4 - Delete a meal"
    puts "5 - Add new customer"
    puts "6 - List all customers"
    puts "7 - Edit a customer"
    puts "8 - Delete a customer"
    puts "0 - EXIT"
  end
end
