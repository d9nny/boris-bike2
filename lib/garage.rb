require_relative 'docking_station'
require_relative 'bike'

class Garage

attr_reader :work_queue

  def van_collect(station)
    @work_queue = station.broken_bikes
  end

  def repair
  	@work_queue.each do |bike| 
      bike.fix
    end
  end

  def van_distribute (station)
    @work_queue.each { |bike| station.dock(bike)} 
  end

end