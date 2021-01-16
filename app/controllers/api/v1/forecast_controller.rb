class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    weather = WeatherFacade.get_forecast(location)
    render json: ForecastSerializer.new(weather)
  end
end
