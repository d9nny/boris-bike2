require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :broken

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.each do |bike|
      return @bikes.delete(bike) if bike.working?
    end
    "No working bikes"
  end

  def dock(bike, working=true)
    fail 'Already full' if full?
    bike.report_broken if working == false
    @bikes << bike
  end

  def broken_bikes
    @bikes.each do |bike|
      if !bike.working?
        @broken << @bikes.delete(bike)
      end
    end
    @broken
  end

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  private :full?, :empty?
end


# station = DockingStation.new
# bike = Bike.new
# bike2 = Bike.new
# p station.dock(bike)
# p station.dock(bike,false)
