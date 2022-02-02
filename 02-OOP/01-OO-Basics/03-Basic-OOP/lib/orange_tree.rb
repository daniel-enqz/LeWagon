class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age, :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dying_probability = 50
  end

  def one_year_passes!
    @age += 1
    @height += 1 if @age <= 10
    @fruits = 100 if @age > 5 && @age < 10
    @fruits = 200 if @age >= 10 && @age < 15
    @fruits = 0 if @age >= 15
  end

  def dead?
    if @age <= 50
      return false
    elsif @age > 50 && @age <= 100
      dies = rand(1..@dying_probability - 1)
      dies == 1
    else
      return true
    end
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits.positive?
  end
end
