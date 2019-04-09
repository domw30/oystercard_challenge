class Oystercard
  attr_reader :balance
  attr_reader :in_journey

MAXIMUM_BALANCE = 90

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(amount)
    raise "£#{MAXIMUM_BALANCE}, maximum exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'insufficient funds' if @balance < 1
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
