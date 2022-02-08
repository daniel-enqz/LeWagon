require_relative '../models/customer'
require 'csv'
require 'pry-byebug'

class CustomerRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @customers = []
    if File.exist?(csv_path)
      load_csv
    else
      puts "unexisting_file.csv"
    end
  end

  def correct_id
    if @customers.count < 1
      1
    else
      @customers.last.id + 1
    end
  end

  def create(customer)
    customer.id = correct_id
    @customers << customer
    save_to_csv
  end

  def all
    return @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def save_to_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(id: row[:id], name: row[:name], address: row[:address])
    end
  end
end
