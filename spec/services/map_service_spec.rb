require 'rails_helper'

describe MapService do
  context ".get_location_coords" do
    it "returns coordinates for a given location" do
      location = MapService.get_location_coords("denver, co")
      coords = location[:results][0][:locations][0][:latLng]
      expect(location).to be_a(Hash)
      expect(coords).to be_a(Hash)
      expect(coords[:lat]).to be_a(Numeric)
      expect(coords[:lng]).to be_a(Numeric)
    end
  end
end
