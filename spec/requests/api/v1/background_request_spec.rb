require 'rails_helper'

describe 'Background' do
  it "returns a given location's current, daily, and hourly forecasts" do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)

    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq("image")

    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_an(Hash)
    expect(json[:data][:attributes]).to have_key(:location)
    expect(json[:data][:attributes]).to be_an(String)
    expect(json[:data][:attributes]).to have_key(:urls)
    expect(json[:data][:attributes][:urls]).to be_an(Hash)
  end
end
