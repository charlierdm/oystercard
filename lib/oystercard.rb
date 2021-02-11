class Oystercard
	LIMIT = 90
	MIN = 1
	attr_reader :balance, :entry_station, :exit_station, :journey_log, :latest_journey

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
		!!entry_station
	end

	def touch_in(entry_station)
		fail "Balance not sufficient" if @balance < MIN
		@entry_station = entry_station
		@latest_journey[:entry] = @entry_station
	end

	def touch_out(exit_station)
		deduct(MIN)
		@exit_station = exit_station
		@latest_journey[:exit] = @exit_station
		@entry_station = nil
	end

	private
	def deduct(fare)
		@balance -= fare
	end

end
