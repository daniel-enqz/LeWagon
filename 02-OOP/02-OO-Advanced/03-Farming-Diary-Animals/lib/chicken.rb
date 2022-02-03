require_relative 'animal'

class Chicken < Animal
  def initialize(gender)
    @gender = gender
    @eggs = 0
    @energy = 0
  end

  def talk
    if @gender == "female"
      return "cluck cluck"
    else
      return "cock-a-doodle-doo"
    end
  end

  def feed!
    if @gender == "female"
      @eggs += super * 2
    else
      super
    end
  end
end
