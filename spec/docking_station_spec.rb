require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive(:working).and_return(true)
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
    allow(bike).to receive(:working?).and_return(true)
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
    expect {subject.dock(bike)}.to raise_error("Already full")
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

    let(:bike3) { double :bike3 }
  it 'docking station does not release a broken bike, just working ones' do
    allow(bike3).to receive(:working?).and_return(false)
    allow(bike3).to receive(:working).and_return(false)
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:working).and_return(true)

    bike1 = bike3
    bike2 = bike  #potentially an issue?
    subject.dock(bike1)
    subject.dock(bike2)
    expect(subject.release_bike).to eq bike2
  end

  # it { is_expected.to respond_to(:repair) }


  # it 'repair collects the broken bikes' do
  #   bike1 = Bike.new
  #   p subject.dock(bike1, false)
  #   p expect(subject.repair).to eq bike1
  # end
end