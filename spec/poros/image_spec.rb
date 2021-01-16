require 'rails_helper'

RSpec.describe Image do
  it "exists" do
    location = "denver, co"
    image_data = ImageService.get_image_data(location)
    image = Image.new(image_data, location)

    expect(image).to be_a(Image)
    expect(image.image_url).to be_a(String)
    expect(image.location).to be_a(String)
    expect(image.description).to be_a(String)
    expect(image.credit).to be_a(Hash)
    expect(image.credit).to have_key(:source)
    expect(image.credit[:source]).to be_a(String)
    expect(image.credit).to have_key(:author)
    expect(image.credit[:author]).to be_a(String)
  end
end
