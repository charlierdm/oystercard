class Journey
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start_journey(entry)
    @entry_station += [entry.name, entry.zone]
  end

  def end_journey(exit)
    @exit_station += [exit.name, exit.station]
  end

  def fare
    @entry_station == nil || @exit_station == nil ? 6 : 1
  end

end
