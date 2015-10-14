require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    fail 'No bikes available' if @bikes.length == 0
    @bikes.pop
  end

  def dock(bike)
    fail 'Already full' if @bikes.length >= @capacity
    @bikes << bike
  end
end

