require 'rails_helper'

RSpec.describe DailyWeather do
  it "exists", :vcr do
    coords = MapService.get_location_coords("denver, co")
    forecast_data = WeatherService.get_forecast_by_coords(coords)
    data = forecast_data[:daily][0..4].first
    daily_weather = DailyWeather.new(data)

    expect(daily_weather).to be_a(DailyWeather)
    expect(daily_weather.date).to be_a(String)
    expect(daily_weather.sunrise).to be_a(String)
    expect(daily_weather.sunset).to be_a(String)
    expect(daily_weather.max_temp).to be_a(Numeric)
    expect(daily_weather.min_temp).to be_a(Numeric)
    expect(daily_weather.conditions).to be_a(String)
    expect(daily_weather.icon).to be_a(String)
  end
end
