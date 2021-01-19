class Api::V1::MunchiesController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    food = params[:food]

    # route_data = MapService.get_route_data(origin, destination)
    # duration = RoadTripFacade.confirmed_destination(route_data)
    # time = Time.now.to_i + duration
    # travel_time = RoadTripFacade.confirmed_travel_time(route_data)
    # coords = MapService.get_location_coords(destination)
    # current_forecast = WeatherService.get_forecast_by_coords(coords)[:current]
    #
    # yelp_data = MunchiesService.get_munchies_data(destination, time, food)

    munchie = MunchiesFacade.get_munchies(origin, destination, food)

  end
end
