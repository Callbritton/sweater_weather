require 'rails_helper'

RSpec.describe CurrentWeather do
  it "exists", :vcr do
    coords = MapService.get_location_coords("denver, co")
    forecast_data = WeatherService.get_forecast_by_coords(coords)
    current_weather = CurrentWeather.new(forecast_data[:current])

    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather.datetime).to be_a(String)
    expect(current_weather.sunrise).to be_a(String)
    expect(current_weather.sunset).to be_a(String)
    expect(current_weather.temperature).to be_a(Numeric)
    expect(current_weather.feels_like).to be_a(Numeric)
    expect(current_weather.humidity).to be_a(Numeric)
    expect(current_weather.uvi).to be_a(Numeric)
    expect(current_weather.visibility).to be_a(Numeric)
    expect(current_weather.conditions).to be_a(String)
    expect(current_weather.icon).to be_a(String)
  end
end
