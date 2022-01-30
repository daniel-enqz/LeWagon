DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

COMBOS = {
  "BEST_OF_MCCHICKEN" => {
    "burger" => "McChicken",
    "side" => "Salad",
    "beverage" => "Sprite"
  },

  "BEST_OF_BIG_MAC" => {
    "burger" => "Big Mac",
    "side" => "French Fries",
    "beverage" => "Coca Cola"
  },

  "HAPPY_MEAL" => {
    "burger" => "Cheese Burger",
    "side" => "French Fries",
    "beverage" => "Coca Cola"
  }
}

def poor_calories_counter(array_of_dishes)
  DISHES_CALORIES[array_of_dishes[0]] + DISHES_CALORIES[array_of_dishes[1]] + DISHES_CALORIES[array_of_dishes[2]]
end

def calories_counter(orders)
  final_calories = []
  final_calories << poor_calories_counter(COMBOS["BEST_OF_BIG_MAC"].values) if orders.include? "Best Of Big Mac"
  final_calories << poor_calories_counter(COMBOS["HAPPY_MEAL"].values) if orders.include? "Happy Meal"
  final_calories << poor_calories_counter(COMBOS["BEST_OF_MCCHICKEN"].values) if orders.include? "Best Of McChicken"
  # final_calories << DISHES_CALORIES.delete("French Fries", "Sprite")
  DISHES_CALORIES.each { |key, value| final_calories << value if orders.include? key }
  final_calories.sum
end

orders = ["Best Of Big Mac", "Salad", "Happy Meal", "Sprite"]
puts calories_counter(orders)
