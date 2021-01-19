require 'rails_helper'

RSpec.describe Weather do
  it "exists", :vcr do
    coords = MapService.get_location_coords("denver, co")
    forecast_data = WeatherService.get_forecast_by_coords(coords)

    current_data = forecast_data[:current]
    daily_data = forecast_data[:daily][0..4].first
    hourly_data = forecast_data[:hourly][0..7].first

    current_weather = CurrentWeather.new(current_data)
    daily_weather = DailyWeather.new(daily_data)
    hourly_weather = HourlyWeather.new(hourly_data)

    weather = Weather.new(current_weather, daily_weather, hourly_weather)
    expect(weather).to be_a(Weather)
    expect(weather.current_weather).to be_a(CurrentWeather)
    expect(weather.daily_weather).to be_a(DailyWeather)
    expect(weather.hourly_weather).to be_a(HourlyWeather)
  end
end
