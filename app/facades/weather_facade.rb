class WeatherFacade
  def self.get_forecast(location)
    coords = MapService.get_location_coords(location)
    forecast_data = WeatherService.get_forecast_by_coords(coords)
    current_weather = CurrentWeather.new(forecast_data[:current])
    daily_weather = daily_forecast(forecast_data[:daily][0..4])
    hourly_weather = hourly_forecast(forecast_data[:hourly][0..7])
    Weather.new(current_weather, daily_weather, hourly_weather)
  end

  def self.daily_forecast(forecast_data)
    forecast_data.map do |data|
      DailyWeather.new(data)
    end
  end

  def self.hourly_forecast(forecast_data)
    forecast_data.map do |data|
      HourlyWeather.new(data)
    end
  end
end
