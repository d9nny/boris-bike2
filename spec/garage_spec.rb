require 'garage'
require 'bike'

describe Garage do

	it { is_expected.to respond_to :van_collect }
  it { is_expected.to respond_to :van_distribute }

  describe '#van_collect' do
    let(:station) { double :station}
    it 'collects broken bike from a specified docking station' do
      allow(station).to receive(:broken_bikes).and_return([1,2,3,4,5])
      expect(subject.van_collect(station)).to eq([1,2,3,4,5])
    end
  end

  it {is_expected.to respond_to :repair}


  it 'repairs the broken bikes' do
  	 bike = Bike.new
    bike.report_broken
     @work_queue = [bike]
  	p expect(subject.repair(@work_queue) { |bike| bike.working?}).to eq true
  end

end