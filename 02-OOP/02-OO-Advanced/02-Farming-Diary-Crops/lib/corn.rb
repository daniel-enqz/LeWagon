require_relative 'crop'
# TODO: code the Corn class
class Corn < Crop
  def water!
    @grains += 10
  end
end
