require 'rails_helper'

RSpec.describe RoadTrip do
  it "exists" do
    origin = "denver, co"
    destination = "pueblo, co"
    route_data = MapService.get_route_data(origin, destination)
    coords = MapService.get_location_coords(destination)
    forecast_data = WeatherService.get_forecast_by_coords(coords)[:hourly].first
    forecast = DestinationWeather.new(forecast_data)
    travel_time = route_data[:route][:legs][0][:time]
    road_trip = RoadTrip.new(origin, destination, travel_time, forecast)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to be_a(String)
    expect(road_trip.end_city).to be_a(String)
    expect(road_trip.travel_time).to be_a(Numeric)
    expect(road_trip.weather_at_eta).to be_a(Hash)
    expect(road_trip.weather_at_eta).to have_key(:temperature)
    expect(road_trip.weather_at_eta[:temperature]).to be_a(Numeric)
    expect(road_trip.weather_at_eta).to have_key(:conditions)
    expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
  end
end
