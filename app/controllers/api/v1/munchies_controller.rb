class Api::V1::MunchiesController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end_location]
    food = params[:food]

    if origin == "" || origin == nil
      render json: { errors: "Missing start location" }, status: 400
    elsif destination == "" || destination == nil
      render json: { errors: "Missing end location" }, status: 400
    elsif food == "" || food == nil
      render json: { errors: "Missing cuisine type" }, status: 400
    else
      munchie = MunchiesFacade.get_munchies(origin, destination, food)
      render json: MunchieSerializer.new(munchie)
    end
  end
end
