class Api::V1::MunchiesController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    food = params[:food]

    route_data = MapService.get_route_data(origin, destination)
    duration = RoadTripFacade.confirmed_destination(route_data)
    time = Time.now.to_i + duration

    conn = Faraday.new(url: 'https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end

    response = conn.get("/v3/businesses/search") do |f|
      f.params['location'] = destination
      f.params['categories'] = food
      f.params['open_at'] = time
      f.params['limit'] = 1
    end

    yelp_data = JSON.parse(response.body, symbolize_names: true)

  end
end
