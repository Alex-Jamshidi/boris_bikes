require 'docking_station'
describe DockingStation do

    it "checks if bike is working" do
        station = DockingStation.new
        green_bike = Bike.new

        station.dock(green_bike)
        expect(station.release_bike.working?).to be true
    end

    it "responds to dock" do
        expect(DockingStation.new).to respond_to :dock
    end

    it  "returns bike name once docked" do
        green_bike = Bike.new

        expect(DockingStation.new.dock(green_bike)).to eq [green_bike]
    end

    it "return false if there is no bike" do
        station = DockingStation.new
        expect(station.is_there_bike?).to eq false
    end

    it "checks if it has any bikes" do
        station = DockingStation.new
        green_bike = Bike.new

        station.dock(green_bike)
        expect(station.is_there_bike?).to eq true
    end 

    it "return error if release_bike called when no bikes available" do
        station = DockingStation.new
        expect{station.release_bike}.to raise_error("No Bike Available")
    end

=begin
    it "returns error if bike is docked when station already contains a bike" do
        station = DockingStation.new
        station.dock(Bike.new)
        red_bike = Bike.new

        expect{station.dock(red_bike)}.to raise_error("Docking Station Already Contains Bike")
    end
=end

    it "returns error if more than 20 bikes are docked" do
        station = DockingStation.new
        bike = Bike.new
        20.times { station.dock(bike) }
    end

end
