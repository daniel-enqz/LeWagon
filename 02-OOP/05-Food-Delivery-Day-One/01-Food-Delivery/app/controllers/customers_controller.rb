require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(repository)
    @repository = repository
    @view       = CustomersView.new
  end

  def add
    name = @view.ask_for("customer name?")
    address = @view.ask_for("customer address?")
    new_customer = Customer.new(name: name, address: address)
    @repository.create(new_customer)
    list
  end

  def list
    all_customers = @repository.all
    @view.display(all_customers)
  end

  def delete
    list
    index = @view.ask_for_index
    @repository.remove(index)
    list
  end

  def edit
    list
    index = @view.ask_for_index
    to_edit = @repository.edit_customer(index)
    name = @view.ask_for("customer name?")
    address = @view.ask_for("customer address?")
    to_edit.name = name
    to_edit.address = address
    list
  end
end
