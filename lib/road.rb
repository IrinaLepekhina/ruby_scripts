class Road

  def need_stops(distance, tank_size, gas_stations)
    current_position = 0
    fuel = tank_size
    stops = 0

    if distance <= tank_size
      return stops = 0
    end

    if gas_stations.length == 0
      return stops = -1
    end
    
    if gas_stations[0][0] >= tank_size
      return stops = -1
    end

    
    gas_stations.each_with_index do |station, i|
      distance_to_station = station[0]

      if fuel >= distance - current_position
        return stops
      elsif fuel >= distance_to_station
        current_position += distance_to_station
        fuel -= distance_to_station
      elsif [fuel + gas_stations[i-1][1], tank_size].min >= distance_to_station
        fuel = [fuel + gas_stations[i-1][1], tank_size].min
        stops += 1
        current_position += distance_to_station
        fuel -= distance_to_station
      else
        stops = -1
        break
      end
    end

    return stops  
  end

end