require 'rails_helper'

describe RoadTripFacade do
  context ".get_road_trip" do
    it "creates a road trip object based on given origins and destinations", :vcr do
      road_trip = RoadTripFacade.get_road_trip("denver, co", "pueblo, co")
      expect(road_trip).to be_a(RoadTrip)
      expect(road_trip.start_city).to be_a(String)
      expect(road_trip.end_city).to be_a(String)
      expect(road_trip.travel_time).to be_a(String)
      expect(road_trip.weather_at_eta).to be_a(Hash)
      expect(road_trip.weather_at_eta).to have_key(:temperature)
      expect(road_trip.weather_at_eta[:temperature]).to be_a(Numeric)
      expect(road_trip.weather_at_eta).to have_key(:conditions)
      expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
    end
  end
end
