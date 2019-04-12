class Journey

  attr_reader :entry_station, :exit_station

MINIMUM_FARE = 3
PENALTY_FARE = 6

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def journey_complete?
    @entry_station && @exit_station ? true : false
  end

  def fare
    self.journey_complete? ? MINIMUM_FARE : PENALTY_FARE
  end

end
