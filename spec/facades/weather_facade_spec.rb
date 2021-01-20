require 'rails_helper'

describe WeatherFacade do
  context ".instance methods" do
    it "creates a weather object with current weather, hourly weather, and daily weather attributes", :vcr do
      weather = WeatherFacade.get_forecast("denver, co")

      expect(weather).to be_a(Weather)
      expect(weather.current_weather).to be_a(CurrentWeather)
      expect(weather.daily_weather).to be_a(Array)
      expect(weather.daily_weather.first).to be_a(DailyWeather)
      expect(weather.hourly_weather).to be_a(Array)
      expect(weather.hourly_weather.first).to be_a(HourlyWeather)
    end

    it "creates a daily weather object with forecast data", :vcr do
      coords = MapService.get_location_coords("denver, co")
      forecast_data = WeatherService.get_forecast_by_coords(coords)
      daily_weather = WeatherFacade.daily_forecast(forecast_data[:daily][0..4])

      expect(daily_weather).to be_a(Array)
      expect(daily_weather.first).to be_a(DailyWeather)
    end

    it "creates a daily weather object with forecast data", :vcr do
      coords = MapService.get_location_coords("denver, co")
      forecast_data = WeatherService.get_forecast_by_coords(coords)
      hourly_weather = WeatherFacade.hourly_forecast(forecast_data[:hourly][0..7])

      expect(hourly_weather).to be_a(Array)
      expect(hourly_weather.first).to be_a(HourlyWeather)
    end
  end
end
