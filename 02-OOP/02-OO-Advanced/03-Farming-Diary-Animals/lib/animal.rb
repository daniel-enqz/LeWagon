class Animal
  attr_reader :eggs, :milk

  def initialize
    @milk = 0
    @energy = 0
  end

  def feed!
    @energy = 1
  end
end
