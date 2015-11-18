require 'docking_station'

describe DockingStation do

  let(:docking_station) {described_class.new}
  let(:bike1) { double :bike }
  let(:bike2) { double :bike }

  describe '#initialize' do
    it 'allows a user to input a capacity' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30
    end

    it 'capacity defaults to DEFAULT_CAPACITY if no user input' do
      expect(docking_station.capacity).to eq 20
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      allow(bike1).to receive(:working?).and_return(true)
      docking_station.dock(bike1)
      expect(docking_station.release_bike).to eq bike1
    end

    it 'raises error when docking_station is empty' do
      expect {docking_station.release_bike}.to raise_error("No bikes available")
    end

    it 'if no working bike are available it returns a message' do
      allow(bike1).to receive(:report_broken)
      allow(bike1).to receive(:working?)
      docking_station.dock(bike1, false)
      expect(docking_station.release_bike).to eq 'No working bikes'
    end

    it 'does not release a broken bike, just working ones' do
      allow(bike1).to receive(:working?).and_return(false)
      allow(bike1).to receive(:working).and_return(false)
      allow(bike2).to receive(:working?).and_return(true)
      allow(bike2).to receive(:working).and_return(true) 
      docking_station.dock(bike1)
      docking_station.dock(bike2)
      expect(docking_station.release_bike).to eq bike2
    end
  end

  describe '#dock' do
    it 'refuses to dock bike when already at capacity' do
      allow(bike1).to receive(:working?).and_return(true)
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(bike1) }
      expect {docking_station.dock(bike1)}.to raise_error("Already full")
    end

    it 'calls report_broken if the bike is not working' do
      expect(bike1).to receive(:report_broken)
      docking_station.dock(bike1, false)
    end

    it 'docks a bike when not full' do
      docking_station.dock(bike1)
      expect(docking_station.bikes).to eq [bike1]
    end
  end

  describe '#broken_bikes' do
    it 'collects the broken bikes' do
      allow(bike1).to receive(:report_broken)
      allow(bike1).to receive(:working?)
      docking_station.dock(bike1, false)
      expect(docking_station.broken_bikes).to eq [bike1]
    end
  end
end