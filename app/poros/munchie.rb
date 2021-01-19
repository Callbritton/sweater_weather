class Munchie
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(yelp_data, travel_time, destination, current_forecast)
    @destination_city = destination
    @travel_time = travel_time
    @forecast = {
      summary: current_forecast[:weather][0][:description],
      temperature: current_forecast[:temp]
    }
    @restaurant = {
      name: yelp_data[:businesses][0][:name],
      address: address(yelp_data)
    }
  end

  def address(yelp_data)
    location = yelp_data[:businesses][0][:location]
    "#{location[:address1]} #{location[:address2]} #{location[:city]} #{location[:state]}, #{location[:zip_code]}"
  end
end
