class WeatherService
  def self.get_forecast_by_coords(coords)
    response = conn.get('data/2.5/onecall') do |f|
      f.params[:lat] = coords[:results][0][:locations][0][:latLng][:lat]
      f.params[:lon] = coords[:results][0][:locations][0][:latLng][:lng]
      f.params[:exclude] = 'minutely,alerts'
      f.params[:units] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/') do |faraday|
      faraday.params["appid"] = ENV["WEATHER_API_KEY"]
    end
  end
end
