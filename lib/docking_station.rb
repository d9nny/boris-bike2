require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
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

  # def broken_bikes
  #   @bikes.select do |bike| 
  #     if bike.working == false
  #       @broken_bikes << bike 
  #     end
  #   end
  # end

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
