class Oystercard
  
  attr_reader :balance, :max_balance

  MAX_BALANCE = 90

  def initialize(max_balance=MAX_BALANCE)
    @balance = 0
    @max_balance = max_balance
  end

  def top_up(amount)
    raise "Balance cannot exceed £#{max_balance}" if @balance + amount > max_balance
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
