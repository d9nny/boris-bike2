require_relative 'docking_station'

class Bike

  def initialize
    @working = true
  end

  def report_broken
  	@working = false
  end

  def working?
    @working 
  end

end


