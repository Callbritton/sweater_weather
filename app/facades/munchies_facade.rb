class MunchiesFacade
  def self.get_munchies(origin, destination, food)
    route_data = MapService.get_route_data(origin, destination)
    travel_time = RoadTripFacade.confirmed_travel_time(route_data)
    coords = MapService.get_location_coords(destination)
    current_forecast = WeatherService.get_forecast_by_coords(coords)[:current]
    duration = RoadTripFacade.confirmed_destination(route_data)
    time = Time.now.to_i + duration
    yelp_data = MunchiesService.get_munchies_data(destination, time, food)
    Munchie.new(yelp_data, travel_time, destination, current_forecast)
  end
end
