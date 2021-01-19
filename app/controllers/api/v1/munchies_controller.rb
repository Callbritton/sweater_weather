class Api::V1::MunchiesController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end_location]
    food = params[:food]

    munchie = MunchiesFacade.get_munchies(origin, destination, food)
    render json: MunchieSerializer.new(munchie)
  end
end
