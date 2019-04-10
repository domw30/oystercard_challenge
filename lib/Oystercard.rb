class Oystercard
  attr_reader :balance, :entry_station, :trips

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

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

    @trip = {}
    @entry_station = station
    @trip[:Entry] = station

  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
    @trip[:Exit] = station
    @trips << @trip
  end

  def in_journey
    !!@entry_station
  end

private

def deduct(amount)
  @balance -= amount
end

end
