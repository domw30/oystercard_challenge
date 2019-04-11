class Oystercard
  attr_reader :balance, :entry_station, :trips

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 3

  def initialize
    @balance = 0
    @trips = []
    @trip = {}
  end

  def top_up(amount)
    raise "£#{MAXIMUM_BALANCE}, maximum exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'insufficient funds' if @balance < MINIMUM_BALANCE
    @trip = {}
    @trip[:Entry] = station
    return @trip
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @trip[:Exit] = station
    @trips << @trip
  end

  def in_journey
    @trip.length == 1 ? true : false
  end

private

def deduct(amount)
  @balance -= amount
end

end
