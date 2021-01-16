class ImageService
  def self.get_image_data(location)
    response = conn.get("/search/photos") do |f|
      f.params['query'] = location
      f.params['page'] = 1
      f.params['per_page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params['client_id'] = ENV["IMAGE_API_KEY"]
    end
  end
end
