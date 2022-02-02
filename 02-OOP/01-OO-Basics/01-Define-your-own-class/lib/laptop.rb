class Laptop
  attr_reader :model

  def initialize(model, processor, ram, storage)
    @model = model
    @processor = processor
    @ram = ram
    @storage = storage
  end
end
