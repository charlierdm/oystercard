class Journey
  attr_reader :entry_station, :exit_station
  def initialize
    @entry_station = []
    @exit_station = []
  end
  def start_journey(entry_station)
    @entry_station += [entry_station.name, entry_station.zone]
  end
  def end_journey(exit_station)
    @exit_station += [exit_station.name, exit_station.zone]
  end
  def fare
    if @entry_station == [] || @exit_station == []
      6
    else
      1
    end
  end
end
