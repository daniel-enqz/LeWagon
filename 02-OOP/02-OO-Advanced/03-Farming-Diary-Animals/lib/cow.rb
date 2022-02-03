require_relative 'animal'

class Cow < Animal
  def talk
    "moo"
  end

  def feed!
    @milk += super * 2
  end
end
