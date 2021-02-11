class OysterCard
	LIMIT = 90
	MIN = 1
	attr_reader :balance, :journey_log, :latest_journey

	def initialize
		@balance = 0
		@journey_log = []
		@latest_journey = {}
	end

	def top_up(amount)
		fail "You cannot top up more than £#{LIMIT}" if amount + @balance > LIMIT
		@balance += amount
	end

	def in_journey?
		@latest_journey != {}
	end

	def touch_in(entry_station)
		#Journey.new(Station.new("Bank", 1))
		fail "Balance not sufficient" if @balance < MIN
		@latest_journey[:entry] = entry_station
	end

	def touch_out(exit_station)
		@latest_journey[:exit] = exit_station
		record_journey
		@latest_journey = {}
		deduct(MIN)
	end

	private
	def deduct(fare)
		@balance -= fare
	end

	def record_journey
		@journey_log.push(@latest_journey)
	end

end
