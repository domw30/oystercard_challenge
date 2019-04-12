require_relative 'journey'

class Oystercard
  attr_reader :balance, :trips

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 3

  def initialize
    @balance = 0
    @trips = []
  end

  def top_up(amount)
    raise "£#{MAXIMUM_BALANCE}, maximum exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'insufficient funds' if @balance < MINIMUM_BALANCE
    @journey = Journey.new
    journey.start_journey(station)
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    journey.end_journey(station)
    @trips << journey
  end

private

attr_reader :journey

def deduct(amount)
  @balance -= amount
end

end
