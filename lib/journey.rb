
# Let's create a new Journey class, it should be responsible
#  for starting a journey, finishing a journey,
#    calculating the fare of a journey, and
#    returning whether or not the journey is complete.
# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out
require './lib/oystercard'
require './lib/station'
class Journey

attr_reader :start_station

def initialize

end

def start(name, zone)
  @start_station = Station.new(name, zone)
end

def end(name, zone)
  @end_station =
end

def fare
end

def completed?
true
end

end
