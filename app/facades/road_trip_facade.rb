class RoadTripFacade
  def self.get_road_trip(origin, destination)
    route_data = MapService.get_route_data(origin, destination)
    coords = MapService.get_location_coords(destination)
    hourly_forecast_data = WeatherService.get_forecast_by_coords(coords)[:hourly]
    duration = confirmed_destination(route_data)
    travel_time = confirmed_travel_time(route_data)
    forecast = destination_forecast(hourly_forecast_data, duration)
    RoadTrip.new(origin, destination, travel_time, forecast)
  end

  private

  def self.confirmed_destination(route_data)
    if route_data[:route][:realTime] == nil
      0
    else
      route_data[:route][:realTime]
    end
  end

  def self.destination_forecast(hourly_forecast_data, duration)
    data = hourly_forecast_data.find do |forecast|
      forecast[:dt] >= DateTime.now.to_i + duration
    end
    DestinationWeather.new(data)
  end

  def self.confirmed_travel_time(route_data)
    if route_data[:route][:formattedTime] == nil || route_data[:route][:formatted_Time] == '00:00:00'
      "impossible route"
    else
      route_data[:route][:formattedTime]
    end
  end
end
