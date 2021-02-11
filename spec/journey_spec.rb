require 'journey'

describe Journey do
  let(:journey) { Journey.new }

  it "responds to start" do
    expect(journey).to respond_to :start
  end

  it "responds to end" do
    expect(journey).to respond_to :end
  end

  it "responds to fare" do
    expect(journey).to respond_to :fare
  end

  it "returns whether or not the journey is complete" do
    expect(journey).to be_completed
  end

end



# let(:station) { double :station, zone: 2}
