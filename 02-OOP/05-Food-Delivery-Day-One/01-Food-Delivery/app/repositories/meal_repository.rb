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
  end

  def all
    return @meals
  end

  def find
    # @room_repository.find(row[:room_id]) # an instance of a room?
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      row[:price] = row[:price].to_i
      @meals << Meal.new(id: row[:id], name: row[:name], price: row[:price])
    end
  end
end
