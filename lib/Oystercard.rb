class Oystercard
  attr_reader :balance

MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "£#{MAXIMUM_BALANCE}, maximum exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end
end
