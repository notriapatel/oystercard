class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_history
  
  MAX_BALANCE = 90
  MIN_FARE = 1
  MIN_BALANCE = 1
  
  
    def initialize 
      @balance = 0
      @entry_station = nil
      @exit_station = nil
      @journey_history = []
    end 
  
    def top_up(amount)
      raise "Balance cannot exceed £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
      @balance += amount
    end
  
    def touch_in(station)
      raise 'Not enough money on Oystercard' if @balance < MIN_BALANCE
      @entry_station = station
      @journey_history << @entry_station
    end 
  
    def touch_out(station)
      @exit_station = station
      @journey_history << @exit_station
      deduct(MIN_FARE)
      @entry_station = nil
  
    end 
  
    def in_journey?
      !!entry_station
    end 
  
    private
  
    def deduct(amount)
      @balance -= amount
    end 
  
  end 