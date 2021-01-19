require 'rails_helper'

describe MunchiesFacade do
  context ".get_munchies" do
    it "creates a munchie object based on given origin, destination, and food" do
      origin = "Denver, CO"
      destination = "Pueblo, CO"
      food = "Chinese"
      munchie = MunchiesFacade.get_munchies(origin, destination, food)

      expect(munchie).to be_a(Munchie)
      expect(munchie.destination_city).to be_a(String)
      expect(munchie.travel_time).to be_a(String)
      expect(munchie.forecast).to be_a(Hash)
      expect(munchie.restaurant).to be_a(Hash)
    end
  end
end
