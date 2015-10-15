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

  it { is_expected.to respond_to(:dock).with(2) }
  it { is_expected.to respond_to(:bikes) }

  it 'raises error when there are no more bikes available' do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  it 'refuses to dock bike when already at capacity' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect {subject.dock(Bike.new)}.to raise_error("Already full")
  end

  it 'refuses to call private methods' do
    expect {subject.full?}.to raise_error(NoMethodError)
  end

  it 'allows a user to input a capacity' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it 'capacity defaults to DEFAULT_CAPACITY if no user input' do
    expect(subject.capacity).to eq 20
  end

  it 'docking station should not release broken bikes' do
    bike = Bike.new
    5.times {}
    subject.dock(bike, false)
    expect(subject.release_bike).to_not eq bike 
  end

  it 'docking station does not release a broken bike, just working ones' do
    bike1 = Bike.new
    bike2 = Bike.new
    subject.dock(bike1, false)
    subject.dock(bike2, true)
    expect(subject.release_bike).to eq bike2 
  end


end