class Oystercard

  attr_reader :balance, :max_balance, :min_balance, :minimum_charge

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize(max_balance=MAX_BALANCE, min_balance=MIN_BALANCE, minimum_charge=MINIMUM_CHARGE)
    @balance = 0
    @max_balance = max_balance
    @in_journey = false
    @min_balance = min_balance
    @minimum_charge = minimum_charge
  end

  def top_up(amount)
    raise "Balance cannot exceed £#{max_balance}" if @balance + amount > max_balance
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Not enough money on Oystercard' if @balance < min_balance
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
