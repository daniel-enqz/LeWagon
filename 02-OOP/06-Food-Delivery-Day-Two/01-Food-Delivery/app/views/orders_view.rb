class OrdersView
  def ask_for_index
    puts "What number?"
    print ">"
    gets.chomp.to_i - 1
  end

  def display(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1} #{rider.username}"
    end
  end

  # (with meal, employee assigned and customer info)
  def display_undelivered_orders(all)
    all.each_with_index do |order, _index|
      puts "#{order.meal.name}, #{order.employee.username}, #{order.customer.name}"
    end
  end
end
