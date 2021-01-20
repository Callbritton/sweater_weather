class Api::V1::ImageController < ApplicationController
  def show
    location = params[:location]
    image = ImageFacade.get_image(location)
    render json: ImageSerializer.new(image)

    # image = Rails.cache.fetch(
    #     "#{params[:location]}/ImageFacade/get_image", expires_in: 1.hours
    # ) do
    #   ImageFacade.get_image(params[:location]).to_json
    #   render json: ImageSerializer.new(image)
    # end
  end
end
