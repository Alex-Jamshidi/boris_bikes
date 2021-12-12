require 'bb.rb'

describe DockingStation do

    let(:green_bike) { double(:green_bike) }

    it "responds to dock" do
        expect(DockingStation.new).to respond_to :dock
    end

    it  "returns bike name once docked" do
        green_bike = double(:bike)

        expect(DockingStation.new.dock(green_bike)).to eq [green_bike]
    end

    it "return false if there is no bike" do
        station = DockingStation.new
        expect(station.is_there_bike?).to eq false
    end

    it "checks if it has any bikes" do
        station = DockingStation.new
        green_bike = double(:bike)

        station.dock(green_bike)
        expect(station.is_there_bike?).to eq true
    end 

    it "return error if release called when no bikes available" do
        station = DockingStation.new
        expect{station.release}.to raise_error("No Bike Available")
    end

=begin
    it "returns error if bike is docked when station already contains a bike" do
        station = DockingStation.new
        station.dock(double(:bike))
        red_bike = double(:bike)

        expect{station.dock(red_bike)}.to raise_error("Docking Station Already Contains Bike")
    end
=end

    it "returns error if more than 20 bikes are docked" do
        station = DockingStation.new
        green_bike = double(:bike)
        DockingStation::DEFAULT_CAPACITY.times { station.dock(green_bike) }
    end

    it "returns capacity of 50 when DockingStation.new is called" do
        station = DockingStation.new(50)
        expect(station.capacity).to eq 50
    end

    it "returns capacity of 20 when DockingStation.new is called with no capacity parameter" do
        station = DockingStation.new
        expect(station.capacity).to eq 20
    end

    it "if a bike is broken it should not be released" do
        station = DockingStation.new
    
        allow(green_bike).to receive(:report_broken) {false}
        green_bike.report_broken
        allow(green_bike).to receive(:working?) {false}
        station.dock(green_bike)
        
        expect{station.release}.to raise_error("No Bike Available")
    end

    it "broken bike should be allowed to dock" do
        station = DockingStation.new
        green_bike = double(:bike)
        allow(green_bike).to receive(:report_broken) {false}
        green_bike.report_broken 
        station.dock(green_bike)

        expect(station.bikes).to eq [green_bike]
    end


end
