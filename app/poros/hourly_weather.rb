class HourlyWeather
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt]).strftime("%H:%M:%S")
    @temperature = data[:temp]
    @wind_speed = "#{data[:wind_speed]} mph"
    @wind_direction = degree_to_direction(data[:wind_deg])
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end

  def degree_to_direction(wind_deg)
    value = ((wind_deg / 22.5) + 0.5)
    direction = ["N", "NNE", "NE", "ENE", "E", "ESE",  "SE",  "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    direction[(value % 16)]
  end
end
