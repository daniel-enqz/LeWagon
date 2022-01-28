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

HAPPY_MEAL = {
  "burger" => "Cheese Burger",
  "side" => "French Fries",
  "beverage" => "Coca Cola"
}

BEST_OF_BIG_MAC = {
  "burger" => "Big Mac",
  "side" => "French Fries",
  "beverage" => "Coca Cola"
}

BEST_OF_MCCHICKEN = {
  "burger" => "McChicken",
  "side" => "Salad",
  "beverage" => "Sprite"
}

# COMBOS = {
#   "BEST_OF_MCCHICKEN" => {
#     "burger" => "McChicken",
#     "side" => "Salad",
#     "beverage" => "Sprite"
#   } 
# }

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  array = []
  final_calories = []
  orders.each_slice(1) { |tuple| array.push(tuple) }
  array.each_with_index do |meal, _index|
    if meal.map(&:upcase).include? "BEST OF BIG MAC"
      final_calories << poor_calories_counter(BEST_OF_BIG_MAC["burger"], BEST_OF_BIG_MAC["side"], BEST_OF_BIG_MAC["beverage"])
    elsif meal.map(&:upcase).include? "HAPPY MEAL"
      final_calories << poor_calories_counter(HAPPY_MEAL["burger"], HAPPY_MEAL["side"], HAPPY_MEAL["beverage"])   
    elsif meal.map(&:upcase).include? "BEST OF MCCHICKEN"
      final_calories << poor_calories_counter(BEST_OF_MCCHICKEN["burger"], BEST_OF_MCCHICKEN["side"], BEST_OF_MCCHICKEN["beverage"])  
    else
      final_calories << DISHES_CALORIES[meal.join]
    end
  end
  p final_calories
  final_calories.sum
end

orders = ["French Fries", "Happy Meal", "Sprite", "Best Of McChicken"]
puts calories_counter(orders)
