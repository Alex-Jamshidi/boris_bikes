class DockingStation
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY )
    @capacity = capacity
    @bikes = []
  end

  attr_reader :capacity
  attr_reader :bikes

  def dock(bike)
    full? ? raise("Docking Station Already Contains Bike") : @bikes << bike
  end

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end
  
  def release
    (self.is_there_bike?) && @bikes[-1].working? ? @bikes.pop : raise("No Bike Available")
  end

  def is_there_bike?
    @bikes.empty? ? false : true
  end

end



