require 'rails_helper'

describe ImageService do
  context ".get_image_data" do
    it "returns image data for a given location", :vcr do
      location = "denver, co"
      image_data = ImageService.get_image_data(location)

      expect(image_data).to be_a(Hash)
      expect(image_data).to have_key(:results)
      expect(image_data[:results][0]).to have_key(:urls)
      expect(image_data[:results][0][:urls]).to have_key(:regular)
      expect(image_data[:results][0][:urls][:regular]).to be_a(String)
    end
  end
end
