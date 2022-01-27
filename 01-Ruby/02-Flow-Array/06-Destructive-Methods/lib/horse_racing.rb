# reverse the array, prepend the horse position, and add a exclamation mark
# TODO: modify the given array so that it is horse racing consistent. This method should return nil.
def horse_racing_format!(horse_race)
  horse_race.reverse!
  position = 5
  horse_race.each { |horse| horse.prepend("#{position -= 1}-") }
  horse_race.map! { |x| "#{x}!" }
end

horse_race = ["Abricot du Laudot", "Black Caviar", "Brigadier Gerard", "Coup de Folie"]
horse_racing_format!(horse_race)
