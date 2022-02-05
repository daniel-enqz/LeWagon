require_relative 'transaction'
require "pry-byebug"

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount < Transaction
  attr_reader :name, :balance

  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    return "Yo’ve just withdrawn #{add_transaction(-amount)} euros"
  end

  def deposit(amount)
    return "Yo’ve just deposited #{add_transaction(amount)} euros"
  end

  def transactions_history(args = {})
    return "no password given" if args == {}
    return @transactions.join if @password == args[:password]
    return "wrong password" if @password != args[:password]
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    # regex = @iban.match(/(^\w{4})(.{26})(.{3})/)
    @iban[4...-3] = "**************"
    @iban
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
    return "#{@name}, #{iban}, #{@balance}"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @transactions << amount
    # TODO: update the current balance (which represents the balance of the account)
    @balance += amount
    return amount
  end
end
