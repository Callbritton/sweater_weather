require 'rails_helper'

describe 'Forecast' do
  it "returns a given location's current, daily, and hourly forecasts", :vcr do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)

    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq("forecast")

    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_an(Hash)
    expect(json[:data][:attributes]).to have_key(:current_weather)
    expect(json[:data][:attributes]).to be_an(Hash)
    expect(json[:data][:attributes]).to have_key(:daily_weather)
    expect(json[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(json[:data][:attributes]).to have_key(:hourly_weather)
    expect(json[:data][:attributes][:hourly_weather]).to be_an(Array)

    current_weather = json[:data][:attributes][:current_weather]
    daily_weather = json[:data][:attributes][:daily_weather]
    hourly_weather = json[:data][:attributes][:hourly_weather]

    # Current Weather
    expect(current_weather).to have_key(:datetime)
    expect(current_weather[:datetime]).to be_a(String)
    expect(current_weather).to have_key(:sunrise)
    expect(current_weather[:sunrise]).to be_a(String)
    expect(current_weather).to have_key(:sunset)
    expect(current_weather[:sunset]).to be_a(String)
    expect(current_weather).to have_key(:temperature)
    expect(current_weather[:temperature]).to be_a(Numeric)
    expect(current_weather).to have_key(:feels_like)
    expect(current_weather[:feels_like]).to be_a(Numeric)
    expect(current_weather).to have_key(:humidity)
    expect(current_weather[:humidity]).to be_a(Numeric)
    expect(current_weather).to have_key(:uvi)
    expect(current_weather[:uvi]).to be_a(Numeric)
    expect(current_weather).to have_key(:visibility)
    expect(current_weather[:visibility]).to be_a(Numeric)
    expect(current_weather).to have_key(:conditions)
    expect(current_weather[:conditions]).to be_a(String)
    expect(current_weather).to have_key(:icon)
    expect(current_weather[:icon]).to be_a(String)

    # Daily Weather
    expect(daily_weather.count).to eq(5)

    daily_weather.each do |daily|
      expect(daily).to have_key(:date)
      expect(daily[:date]).to be_a(String)
      expect(daily).to have_key(:sunrise)
      expect(daily[:sunrise]).to be_a(String)
      expect(daily).to have_key(:sunset)
      expect(daily[:sunset]).to be_a(String)
      expect(daily).to have_key(:max_temp)
      expect(daily[:max_temp]).to be_a(Numeric)
      expect(daily).to have_key(:min_temp)
      expect(daily[:min_temp]).to be_a(Numeric)
      expect(daily).to have_key(:conditions)
      expect(daily[:conditions]).to be_a(String)
      expect(daily).to have_key(:icon)
      expect(daily[:icon]).to be_a(String)
    end

    # Hourly Weather
    expect(hourly_weather.count).to eq(8)

    hourly_weather.each do |hourly|
      expect(hourly).to have_key(:time)
      expect(hourly[:time]).to be_a(String)
      expect(hourly).to have_key(:temperature)
      expect(hourly[:temperature]).to be_a(Numeric)
      expect(hourly).to have_key(:wind_speed)
      expect(hourly[:wind_speed]).to be_a(String)
      expect(hourly).to have_key(:wind_direction)
      expect(hourly[:wind_direction]).to be_a(String)
      expect(hourly).to have_key(:conditions)
      expect(hourly[:conditions]).to be_a(String)
      expect(hourly).to have_key(:icon)
      expect(hourly[:icon]).to be_a(String)
    end
  end
end
