# Let's create a new Journey class, it should be responsible
#  for starting a journey, finishing a journey,
#    calculating the fare of a journey, and
#    returning whether or not the journey is complete.
# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out
require './lib/station'
class Journey

  attr_reader :start_station

  def initialize

  end

def start(start_station = Station.new(name, zone))
  @start_station = start_station
end

def end
end

def fare
end

def completed?
  true
end

end

# attr_reader :entry_station, :exit_station
# def initialize
#   @entry_station = nil
#   @exit_station = nil
# end
#
# def start_journey(entry)
#   @entry_station += [entry.name, entry.zone]
# end
#
# def end_journey(exit)
#   @exit_station += [exit.name, exit.station]
# end
#
# def fare
#   @entry_station == nil || @exit_station == nil ? 6 : 1
# end
