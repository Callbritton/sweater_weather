class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(origin, destination, travel_time, forecast)
    @start_city = origin
    @end_city = destination
    @travel_time = travel_time
    @weather_at_eta = weather_formatted(forecast)
  end

  def weather_formatted(forecast)
    {
      temperature: forecast.temperature,
      conditions: forecast.conditions
    }
  end
end
