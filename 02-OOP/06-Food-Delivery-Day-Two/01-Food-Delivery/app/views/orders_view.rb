require 'pry-byebug'
class OrdersView
  def ask_for_index
    puts "What number?"
    print ">"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} #{order}"
    end
  end

  def display_undelivered_orders(all)
    all.each_with_index do |order, _index|
      puts "#{order.meal.name}, #{order.employee.username}, #{order.customer.name}"
    end
  end

  def display_my_orders(order); end
end
