class Api::V1::ImageController < ApplicationController
  def show
    location = params[:location]

    conn = Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params['client_id'] = ENV["IMAGE_API_KEY"]
      f.params['query'] = location
      f.params['page'] = 1
      f.params['per_page'] = 1
    end

    response = conn.get("/search/photos")

    parsed = JSON.parse(response.body, symbolize_names: true)

    require "pry"; binding.pry
  end
end
