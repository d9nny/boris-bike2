require_relative 'docking_station'

class Garage



  def van_collect(station)
    @work_queue = station.broken_bikes
  end

  def repair
  	# @work_queue.each do |bike|
  	
  	# end
  end

  def van_distribute
  end

end