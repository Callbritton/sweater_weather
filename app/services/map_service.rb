class MapService
  def self.get_location_coords(location)
    response = conn.get("/geocoding/v1/address") do |f|
      f.params[:location] = location
    end
   JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params[:key] = ENV["MAP_API_KEY"]
    end
  end
end
