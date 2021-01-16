class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]

    map_conn = Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params[:key] = ENV["MAP_API_KEY"]
    end

    map_response = map_conn.get("/geocoding/v1/address") do |f|
      f.params[:location] = location
    end

    map = JSON.parse(map_response.body, symbolize_names: true)

    lat = map[:results][0][:locations][0][:latLng][:lat]
    lng = map[:results][0][:locations][0][:latLng][:lng]

    weather_conn = Faraday.new(url: 'https://api.openweathermap.org/') do |faraday|
      faraday.params["appid"] = ENV["WEATHER_API_KEY"]
    end

    weather_response = weather_conn.get('data/2.5/onecall') do |f|
      f.params[:lat] = lat
      f.params[:lon] = lng
      f.params[:exclude] = 'minutely,alerts'
      f.params[:units] = 'imperial'
    end

    weather = JSON.parse(weather_response.body, symbolize_names: true)


  end
end
