require 'rails_helper'

describe WeatherService do
  context ".get_forecast_by_coords" do
    it "returns forecast information for the given coords" do
      coords = MapService.get_location_coords("denver, co")
      weather_service = WeatherService.get_forecast_by_coords(coords)

      expect(weather_service).to be_a(Hash)
      expect(weather_service[:lat]).to be_a(Numeric)
      expect(weather_service[:lon]).to be_a(Numeric)
    end
  end
end
