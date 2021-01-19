class MunchiesService
  def self.get_munchies_data(destination, time, food)
    response = conn.get("/v3/businesses/search") do |f|
      f.params['location'] = destination
      f.params['categories'] = food
      f.params['open_at'] = time
      f.params['limit'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
  end
end
