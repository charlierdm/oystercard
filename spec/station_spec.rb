require 'station'

describe Station do
  subject { described_class.new("Brixton", 2) }

  it { is_expected.to respond_to :name, :zone }

  it 'knows the station name' do
    expect(subject.name).to eq("Brixton")
  end

  it 'knows the zone' do
    expect(subject.zone).to eq(2)
  end

end
