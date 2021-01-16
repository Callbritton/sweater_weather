class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).strftime("%A, %B %e %Y")
    @sunrise = Time.at(data[:sunrise]).strftime("%Y-%m-%d %H:%M:%S %z")
    @sunset = Time.at(data[:sunset]).strftime("%Y-%m-%d %H:%M:%S %z")
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
