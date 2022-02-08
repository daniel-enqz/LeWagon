require_relative '../models/meal'
require 'csv'
require 'pry-byebug'

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []
    if File.exist?(csv_path)
      load_csv
    else
      puts "unexisting_file.csv"
    end
  end

  def correct_id
    if @meals.count < 1
      1
    else
      @meals.last.id + 1
    end
  end

  def create(meal)
    meal.id = correct_id
    @meals << meal
    save_to_csv
  end

  def all
    return @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def save_to_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(id: row[:id], name: row[:name], price: row[:price])
    end
  end
end
