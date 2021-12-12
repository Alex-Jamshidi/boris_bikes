require "bb.rb"

describe Bike do

  it "bike instances should respond to working" do    
    expect(Bike.new).to respond_to :working?
  end

  it "checks if released bike is working" do
    station = DockingStation.new
    green_bike = Bike.new
    station.dock(green_bike)
    released_bike = station.release

    expect(released_bike.working?).to be true
end

  it "a broken bike should be reported as broken on return" do
    green_bike = Bike.new
    station = DockingStation.new
    green_bike.report_broken
    station.dock(green_bike)

    expect(green_bike.working?).to eq false
  end

  

end
