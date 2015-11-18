require 'garage'
require 'bike'

describe Garage do
  let(:garage) {described_class.new}
  let(:station) { double :station}
  let (:bike) {double :bike}

  describe '#van_collect' do
    it 'collects broken bike from a specified docking station' do
      allow(station).to receive(:broken_bikes).and_return([1,2,3,4,5])
      expect(garage.van_collect(station)).to eq([1,2,3,4,5])
    end
  end

  describe '#repair' do
    it 'repairs the broken bikes' do
      allow(station).to receive(:broken_bikes).and_return([bike])
      expect(bike).to receive(:fix)
      garage.van_collect(station)
      garage.repair
    end
  end

  describe '#van_distribute' do
    it 'docks working bikes back into the station' do
      allow(station).to receive(:broken_bikes).and_return([bike])
      expect(station).to receive(:dock)
      garage.van_collect(station)
      garage.van_distribute(station)
    end
  end
end

