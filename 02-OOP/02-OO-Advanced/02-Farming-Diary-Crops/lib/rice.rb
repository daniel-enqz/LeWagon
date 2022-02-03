require_relative 'crop'
# TODO: code the Rice class
class Rice < Crop
  def water!
    @grains += 5
  end

  def transplant!
    @grains += 10
  end
end
