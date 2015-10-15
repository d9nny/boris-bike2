require_relative 'docking_station'

class Bike

  attr_accessor :working

  def initialize
    @working = true
  end


  def working?(working)
    @working = working
  end

end


