class Laptop
  def initialize(model, processor, ram, storage)
    @model = model
    @processor = processor
    @ram = ram
    @storage = storage
  end

  def model
    return @model
  end
end
