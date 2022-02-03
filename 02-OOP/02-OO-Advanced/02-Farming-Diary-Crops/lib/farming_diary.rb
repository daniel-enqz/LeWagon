# DO NOT remove the two lines below, needed for display purposes
require_relative "../spec/helper/board"

require_relative "corn"
require_relative "rice"


puts "\n\n📝 Day One: Corn"
# 1. Instantiate a corn crop
corn = Corn.new
# 2. Water the corn crop
produced_corn = corn.water!
# 3. Replace 'TODO' with the value of `grains` for your crop
puts "The corn crop produced #{produced_corn} grains"
# 4. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The corn crop is #{corn.ripe?}"



puts "\n\n📝 Day Two: Rice"
# 1. Instantiate a rice crop
rice = Rice.new
# 2. Water the rice crop
produced_rice = rice.water!
# 3. Transplant the rice crop
produced_rice += rice.transplant!
# 4. Replace 'TODO' with the value of `grains` for your crop
puts "The rice crop produced #{produced_rice} grains"
# 5. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The rice crop is #{rice.ripe?}"


# DO NOT remove the two lines below, needed for display purposes
Board.new.display
