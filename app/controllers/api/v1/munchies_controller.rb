class Api::V1::MunchiesController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    food = params[:food]

    route_data = MapService.get_route_data(origin, destination)
    duration = RoadTripFacade.confirmed_destination(route_data)
    time = Time.now.to_i + duration
    travel_time = RoadTripFacade.confirmed_travel_time(route_data)
    coords = MapService.get_location_coords(destination)
    current_forecast = WeatherService.get_forecast_by_coords(coords)[:current]

    # conn = Faraday.new(url: 'https://api.yelp.com') do |f|
    #   f.headers['Authorization'] = ENV['YELP_API_KEY']
    # end
    #
    # response = conn.get("/v3/businesses/search") do |f|
    #   f.params['location'] = destination
    #   f.params['categories'] = food
    #   f.params['open_at'] = time
    #   f.params['limit'] = 1
    # end

    # JSON.parse(response.body, symbolize_names: true)

    yelp_data = MunchiesService.get_munchies_data(destination, time, food)

    munchie = Munchie.new(yelp_data, travel_time, destination, current_forecast)

  end
end
