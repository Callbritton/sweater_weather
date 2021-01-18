class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { error: "Unauthorized" }, status: 401
    elsif
      road_trip_params[:origin].nil? || road_trip_params[:destination].nil?
      render json: { error: "Missing field"}, status: 401
    elsif user
      origin = road_trip_params[:origin]
      destination = road_trip_params[:destination]
      road_trip = RoadTripFacade.get_road_trip(origin, destination)
      render json: RoadtripSerializer.new(road_trip), status: 201
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
