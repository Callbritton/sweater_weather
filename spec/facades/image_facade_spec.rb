require 'rails_helper'

describe ImageFacade do
  context ".get_image" do
    it "creates an image object based on a given object" do
      image = ImageFacade.get_image("denver, co")
      expect(image).to be_a(Image)
      expect(image.credit).to be_a(Hash)
      expect(image.description).to be_a(String)
      expect(image.location).to be_a(String)
      expect(image.image_url).to be_a(String)
    end
  end
end
