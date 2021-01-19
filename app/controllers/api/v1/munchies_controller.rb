class Api::V1::MunchiesController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    food = params[:food]

    munchie = MunchiesFacade.get_munchies(origin, destination, food)

  end
end
