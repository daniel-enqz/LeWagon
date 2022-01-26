require_relative "croupier"
require_relative "black_jack"
# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

player_score = pick_player_card
bank_score = pick_bank_score

puts "Card? 'y' or 'yes' to get a new card"
user_choice = gets.chomp

while user_choice == ("y" || "yes")
  puts state_of_the_game(player_score, bank_score)
  player_score += pick_player_card
  puts "Card? 'y' or 'yes' to get a new card"
  user_choice = gets.chomp
end

puts end_game_message(player_score, bank_score)
