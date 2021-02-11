require 'oystercard'

describe OysterCard do
	let (:max) { OysterCard::LIMIT }
	let (:min) { OysterCard::MIN}
	let (:station) { double :station }
	let (:journey) { {entry: station, exit: station} }

	describe '#initialize' do
		it 'should have a default balance of zero' do
			expect(subject.balance).to eq(0)
		end

		it 'should initialize with no journeys' do
			expect(subject.journey_log).to eq([])
		end
	end

	describe '#top_up' do
		it { is_expected.to respond_to(:top_up).with(1).argument }

		it "raises an error when limit is exceeded" do
			subject.top_up(max)
			expect{ subject.top_up 1 }.to raise_error("You cannot top up more than £#{max}")
		end
	end

	describe '#in_journey?' do
		it { is_expected.to respond_to(:in_journey?) }

		it "initially isn't on a journey" do
			expect(subject).not_to be_in_journey
		end
	end

	describe '#touch_in' do
		it 'prevents touch in' do
			expect{ subject.touch_in(station) }.to raise_error "Balance not sufficient"
		end

  end

	describe '#touch_out' do
		it 'can touch out' do
			subject.top_up(max)
			subject.touch_in(station)
			subject.touch_out(station)
			expect(subject.latest_journey[:entry]).not_to eq station
		end

		it "deducts the fare from the balance upon touch_out" do
			subject.top_up(max)
			subject.touch_in(station)
			expect { subject.touch_out(station) }.to change{ subject.balance }.by(- min)
		end
	end

context "stores information about the journey" do
	before(:each) do
		subject.top_up(max)
		subject.touch_in(station)
	end

	it 'stores the entry station' do
		expect(subject.latest_journey[:entry]).to eq station
	end

	it 'stores the exit station' do
		subject.touch_out(station)
		expect(subject.journey_log[-1][:exit]).to eq(station)
	end

	it 'stores the latest journey' do
		expect{subject.touch_out(station)}.to change{subject.journey_log.count}.by(1)
	end

end
end
