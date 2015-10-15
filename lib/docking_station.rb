require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Already full' if full?
    @bikes << bike
  end

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  private :full?, :empty?

end

