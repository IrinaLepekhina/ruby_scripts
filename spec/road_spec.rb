require 'byebug'

# Given a set of gas stations along a road with distances between them and the amount of gas available at each station, 
# find the minimum number of refueling stops required to travel the entire distance. 

describe Road do
  let(:road) {Road.new}
  it "returns 0 when no stops are needed" do
    # (distance, tank_size, gas_stations)
    expect(road.need_stops(100, 200, [[ 50, 100], [ 100, 150] ])).to eq(0)
  end

  it "returns the correct number of stops needed" do
    # (distance, tank_size, gas_stations)
    expect(road.need_stops(100, 60, [[50, 50], [20,  30]])).to eq(1)
    expect(road.need_stops(130, 60, [[50, 50], [50,  50], [20,  30]])).to eq(2)
    expect(road.need_stops(30, 50, [[50, 10], [150, 15]])).to eq(0)
  end 

  it "returns -1 when there are no gas stations" do
    # (distance, tank_size, gas_stations)
    expect(road.need_stops(200, 50, [])).to eq(-1)
  end

  it "returns -1 when there is not enough gas to reach the next gas station" do
    # (distance, tank_size, gas_stations)
    expect(road.need_stops(50, 30, [[25, 10], [25, 5]])).to eq(-1)
  end
end