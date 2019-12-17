class Oystercard
  
  attr_reader :balance, :max_balance

  MAX_BALANCE = 90


  def initialize(max_balance=MAX_BALANCE)
    @balance = 0
    @max_balance = max_balance
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance cannot exceed £#{max_balance}" if @balance + amount > max_balance
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
    @in_journey
  end

  def touch_out
    @in_journey = false
    @in_journey
  end
end
