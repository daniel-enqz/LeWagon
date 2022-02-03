class Crop
  attr_reader :grains

  def initialize
    @grains = 0
  end

  def ripe?
    return "ripe" && true if @grains >= 15
    return "not ripe" && false if @grains < 15
  end
end
