require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../models/order"
require 'pry-byebug'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository     = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository    = order_repository
    @orders_view         = OrdersView.new
    @meals_view          = MealsView.new
    @customers_view      = CustomersView.new
  end

  # :meal, :customer, :employee, :delivered :id

  # MANAGER ACTIONS
  def add
    all = @meal_repository.all
    # @meals_view.display(all)
    meal = all[@orders_view.ask_for_index]

    all = @customer_repository.all
    # @customers_view.display(all)
    customer = all[@orders_view.ask_for_index]

    riders = @employee_repository.all_riders
    # @orders_view.display(riders)
    rider = riders[@orders_view.ask_for_index]

    new_order = Order.new(meal: meal, customer: customer, employee: rider)
    @order_repository.create(new_order)
  end

  def list_undelivered_orders
    all = @order_repository.undelivered_orders
    @orders_view.display_undelivered_orders(all)
  end

  # RIDER ACTIONS
  def list_my_orders(employee)
    # binding.pry
    # @order_repository.employee_undelivered(employee)
  end

  def mark_as_delivered; end
end
