require './lib/station'
require './lib/journey'

class OysterCard
	attr_reader :balance, :entry_station, :exit_station, :journeys
	LIMIT = 90
	MIN = 1
	STARTING_BALANCE = 0

	def initialize(balance = STARTING_BALANCE)
		@balance = balance
		@journeys = []
	end

	def top_up(amount)
		fail "You cannot top up more than £#{LIMIT}" if amount + @balance > LIMIT
		@balance += amount
	end

	def in_journey?
		@journeys.last[:entry_station] != []
	end

	def touch_in(entry_station)
		add_empty_journey
		fail "Balance not sufficient" if @balance < MIN
		@journeys.last[:entry_station] += [entry_station.name, entry_station.zone]
	end

	def touch_out(exit_station)
		deduct
		@journeys.last[:exit_station] += [exit_station.name, exit_station.zone]
	end

	private
	def deduct(fare)
		@balance -= fare
	end

	def add_empty_journey
		@journeys << { entry_station: [], exit_station: [] }
	end

end
