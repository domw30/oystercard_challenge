class Journey

  def initialize
    @journey = {}
  end

  def start_journey(station)
    @journey[:entry] = station
    return @journey
  end

  def end_journey(station)
    @journey[:exit] = station
    return @journey
  end

end
