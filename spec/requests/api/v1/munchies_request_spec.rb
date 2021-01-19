require 'rails_helper'

describe 'Background' do
  it "returns a business in a given city, estimated travel time, and current forecast of destination" do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)

    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq("munchie")

    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_an(Hash)
    expect(json[:data][:attributes]).to have_key(:destination_city)
    expect(json[:data][:attributes][:destination_city]).to be_an(String)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_an(String)
    expect(json[:data][:attributes]).to have_key(:forecast)
    expect(json[:data][:attributes][:forecast]).to be_an(Hash)
    expect(json[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:forecast][:summary]).to be_an(String)
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:forecast][:temperature]).to be_an(Numeric)
    expect(json[:data][:attributes]).to have_key(:restaurant)
    expect(json[:data][:attributes][:restaurant]).to be_an(Hash)
    expect(json[:data][:attributes][:restaurant]).to have_key(:name)
    expect(json[:data][:attributes][:restaurant][:name]).to be_an(String)
    expect(json[:data][:attributes][:restaurant]).to have_key(:address)
    expect(json[:data][:attributes][:restaurant][:address]).to be_an(String)
  end
end
