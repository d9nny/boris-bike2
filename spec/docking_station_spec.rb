require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it { is_expected.to respond_to(:dock).with(1) }
  it { is_expected.to respond_to(:bike) }

  it 'raises error when there are no more bikes available' do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  it 'refuses to dock bike when already at capacity' do
    subject.dock(Bike.new)
    expect {subject.dock(:bike)}.to raise_error("Already full")
  end

end