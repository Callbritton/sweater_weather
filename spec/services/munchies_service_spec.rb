require 'rails_helper'

describe MunchiesService do
  context ".get_munchies_data" do
    it "returns yelp data for a given destination, time, and food" do
      destination = "pueblo, co"
      time = 1611075488
      food = "chinese"
      munchies_data = MunchiesService.get_munchies_data(destination, time, food)

      expect(munchies_data).to be_a(Hash)
      expect(munchies_data).to have_key(:businesses)
      expect(munchies_data[:businesses][0]).to have_key(:name)
      expect(munchies_data[:businesses][0][:name]).to be_a(String)
      expect(munchies_data[:businesses][0]).to have_key(:location)
      expect(munchies_data[:businesses][0][:location]).to be_a(Hash)
      expect(munchies_data[:businesses][0][:location]).to have_key(:address1)
      expect(munchies_data[:businesses][0][:location][:address1]).to be_a(String)
    end
  end
end
