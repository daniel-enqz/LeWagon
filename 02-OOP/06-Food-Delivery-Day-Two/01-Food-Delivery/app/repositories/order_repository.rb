require_relative '../models/order'
require 'csv'
require 'pry-byebug'

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @orders_csv_path     = orders_csv_path
    @meal_repository     = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @elements = []
    load_csv if File.exist?(@orders_csv_path)
  end

  def correct_id
    @elements.empty? ? 1 : @elements.last.id + 1
  end

  def create(model)
    model.id = correct_id
    @elements << model
    save_to_csv
  end

  def employee_undelivered(employee)
    @elements.select { |order| order if order.employee.id == employee.id }
  end

  def undelivered_orders
    @elements.select { |element| element if element.delivered? == false }
  end

  private

  def save_to_csv
    CSV.open(@orders_csv_path, "wb") do |csv|
      csv << ["id", "delivered", "meal_id", "customer_id", "employee_id"]
      @elements.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

  def load_csv
    CSV.foreach(@orders_csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i, row[:delivered] = row[:delivered] == "true"
      row[:meal_id] = row[:meal_id].to_i, row[:customer_id] = row[:customer_id].to_i
      row[:employee_id] = row[:employee_id].to_i
      @elements << Order.new(
        id: row[:id], delivered: row[:delivered], meal: @meal_repository.find(row[:meal_id]),
        customer: @customer_repository.find(row[:customer_id]), employee: @employee_repository.find(row[:employee_id])
      )
    end
  end
end
