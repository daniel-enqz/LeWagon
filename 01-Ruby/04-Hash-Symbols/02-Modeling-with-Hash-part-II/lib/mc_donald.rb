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

HAPPY_MEAL = ["Cheese Burger", "French Fries", "Coca Cola"]
BEST_OF_BIG_MAC = ["Big Mac", "French Fries", "Coca Cola"]
BEST_OF_MCCHICKEN = ["McChicken", "Salad", "Sprite"]

def poor_calories_counter(burger, side, beverage)
  counter += DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  orders.map(&:upcase!)
  array = []
  orders.each_slice(1) { |tuple| array.push(tuple) }
  array.each_with_index do |meal, index|
      if meal.include? "BEST OF BIGMAC"
        poor_calories_counter(BEST_OF_BIG_MAC)
      elsif meal.include? "HAPPY MEAL"
        poor_calories_counter(HAPPY MEAL)        
      elsif meal.include? "BEST OF MCCHICKEN"
        poor_calories_counter(BEST_OF_MCCHICKEN)         
      else
        p meal
      end
  end 
end
  # TODO: return number of calories for a less constrained order


orders = ["French Fries", "Happy Meal", "Sprite", "Best Of McChicken"]
puts calories_counter(orders)
