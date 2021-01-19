require 'rails_helper'

RSpec.describe Munchie do
  it "exists" do
    origin = "Denver, CO"
    destination = "Pueblo, CO"
    food = "chinese"
    route_data = MapService.get_route_data(origin, destination)
    travel_time = RoadTripFacade.confirmed_travel_time(route_data)
    coords = MapService.get_location_coords(destination)
    current_forecast = WeatherService.get_forecast_by_coords(coords)[:current]
    duration = RoadTripFacade.confirmed_destination(route_data)
    time = Time.now.to_i + duration
    yelp_data = MunchiesService.get_munchies_data(destination, time, food)
    munchie = Munchie.new(yelp_data, travel_time, destination, current_forecast)

    expect(munchie).to be_a(Munchie)
    expect(munchie.destination_city).to be_a(String)
    expect(munchie.travel_time).to be_a(String)
    expect(munchie.forecast).to be_a(Hash)
    expect(munchie.forecast).to have_key(:summary)
    expect(munchie.forecast[:summary]).to be_a(String)
    expect(munchie.forecast).to have_key(:temperature)
    expect(munchie.forecast[:temperature]).to be_a(Numeric)
    expect(munchie.restaurant).to be_a(Hash)
    expect(munchie.restaurant).to have_key(:name)
    expect(munchie.restaurant[:name]).to be_a(String)
    expect(munchie.restaurant).to have_key(:address)
    expect(munchie.restaurant[:address]).to be_a(String)
  end

  it ".address" do
    origin = "Denver, CO"
    destination = "Pueblo, CO"
    food = "chinese"
    route_data = MapService.get_route_data(origin, destination)
    travel_time = RoadTripFacade.confirmed_travel_time(route_data)
    coords = MapService.get_location_coords(destination)
    current_forecast = WeatherService.get_forecast_by_coords(coords)[:current]
    duration = RoadTripFacade.confirmed_destination(route_data)
    time = Time.now.to_i + duration
    yelp_data = MunchiesService.get_munchies_data(destination, time, food)
    munchie = Munchie.new(yelp_data, travel_time, destination, current_forecast)

    expect(munchie).to be_a(Munchie)
    expect(munchie.address(yelp_data)).to be_a(String)
  end
end
