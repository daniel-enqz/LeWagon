require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  "Your score is: #{player_score} bank is: #{bank_score}"
  # TODO: return (not print!) a message containing the player's score and bank's score
end

def end_game_message(player_score, bank_score)
  if player_score > 21 || player_score < bank_score
    # Bust
    "Lose"
  elsif player_score == bank_score
    # Player gets money back
    "Push"
  elsif player_score == 21
    "Black Jack"
  else
    "You beat the bank! You win."
  end
end
