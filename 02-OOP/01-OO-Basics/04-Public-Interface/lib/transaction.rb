# Optional

class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @date = Time.now
    @amount = amount
  end

  def to_s
    # Nicely print transaction info using Time#strftime.
    @date.strftime("#{@amount} %d/%m/%Y at %I:%M%p")
  end
end
