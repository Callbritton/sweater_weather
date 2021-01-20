require 'rails_helper'

RSpec.describe HourlyWeather do
  it "exists", :vcr do
    coords = MapService.get_location_coords("denver, co")
    forecast_data = WeatherService.get_forecast_by_coords(coords)
    data = forecast_data[:hourly][0..7].first
    hourly_weather = HourlyWeather.new(data)

    expect(hourly_weather).to be_a(HourlyWeather)
    expect(hourly_weather.time).to be_a(String)
    expect(hourly_weather.temperature).to be_a(Numeric)
    expect(hourly_weather.wind_speed).to be_a(String)
    expect(hourly_weather.wind_direction).to be_a(String)
    expect(hourly_weather.conditions).to be_a(String)
    expect(hourly_weather.icon).to be_a(String)
  end
end
