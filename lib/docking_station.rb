class DockingStation
  
  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def dock(bike)
    @bikes.length < 20 ? @bikes << bike : raise("Docking Station Already Contains Bike") 
  end
  
  def release_bike
    self.is_there_bike? ? @bikes.pop : raise("No Bike Available")
  end

  def is_there_bike?
    @bikes.empty? ? false : true 
  end

end



