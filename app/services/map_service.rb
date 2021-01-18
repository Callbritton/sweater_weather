class MapService
  def self.get_location_coords(location)
    response = conn.get("/geocoding/v1/address") do |f|
      f.params[:location] = location
    end
   parsed(response)
  end

  def self.get_route_data(origin, destination)
    response = conn.get("/directions/v2/route") do |f|
      f.params[:from] = origin
      f.params[:to] = destination
    end
    parsed(response)
  end

  private

  def self.parsed(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params[:key] = ENV["MAP_API_KEY"]
    end
  end
end
