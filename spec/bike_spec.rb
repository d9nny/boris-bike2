require 'bike'

describe Bike do

  let(:bike) {described_class.new}

  it 'initialises a bike as working' do
    expect(bike.working?).to eq true
  end

  it 'changes working to false' do
    expect(bike.report_broken).to eq false
  end

  it 'returns working status of the bike' do
    expect(bike.working?).to eq true
  end
	
	it 'repairs a bike' do
		expect(bike.fix).to eq (true)
	end
end