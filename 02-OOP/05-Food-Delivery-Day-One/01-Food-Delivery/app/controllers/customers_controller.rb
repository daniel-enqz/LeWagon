require_relative "../views/meals_view"
require_relative "../models/customer"

class CustomersController
  def initialize(repository)
    @repository = repository
    @view       = View.new
  end

  def add
    name = @view.ask_for("customer name?")
    address = @view.ask_for("customer address?")
    new_customer = Customer.new(name: name, address: address)
    @repository.create(new_customer)
    # display_meal
  end

  def list
    all_customers = @repository.all
    @view.display(all_customers)
  end
end
