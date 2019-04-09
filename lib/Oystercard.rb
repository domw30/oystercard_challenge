class Oystercard
  attr_reader :balance
  attr_reader :in_journey

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(amount)
    raise "£#{MAXIMUM_BALANCE}, maximum exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    raise 'insufficient funds' if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
  end

private

def deduct(amount)
  @balance -= amount
end

end
