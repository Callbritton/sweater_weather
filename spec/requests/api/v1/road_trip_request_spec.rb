require 'rails_helper'

describe 'Road Trip' do
  it "returns a given location's current, daily, and hourly forecasts" do
    user = User.create(email: "Chris@email.com",
                       password: "1234",
                       password_confirmation: "1234")

    trip_params = ({
                    origin: "Denver,CO",
                    destination: "Pueblo, CO",
                    api_key: "#{user.api_key}"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(trip_params)

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to eq(nil)

    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("roadtrip")

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to be_an(Hash)
    expect(parsed[:data][:attributes]).to have_key(:start_city)
    expect(parsed[:data][:attributes][:start_city]).to be_an(String)
    expect(parsed[:data][:attributes]).to have_key(:end_city)
    expect(parsed[:data][:attributes][:end_city]).to be_an(String)
    expect(parsed[:data][:attributes]).to have_key(:travel_time)
    expect(parsed[:data][:attributes][:travel_time]).to be_an(String)
    expect(parsed[:data][:attributes]).to have_key(:weather_at_eta)
    expect(parsed[:data][:attributes][:weather_at_eta]).to be_an(Hash)
    expect(parsed[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(parsed[:data][:attributes][:weather_at_eta][:temperature]).to be_an(Numeric)
    expect(parsed[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(parsed[:data][:attributes][:weather_at_eta][:conditions]).to be_an(String)
  end

  it "prevents access for an unauthorized user" do
    User.create(email: "Chris@email.com",
                password: "1234",
                password_confirmation: "1234")

    trip_params = ({
                    origin: "Denver,CO",
                    destination: "Pueblo, CO",
                    api_key: "nonsense"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(trip_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it "returns an error if origin or destination are empty" do
    user = User.create(email: "Chris@email.com",
                       password: "1234",
                       password_confirmation: "1234")

    trip_params = ({
                    destination: "Pueblo, CO",
                    api_key: "#{user.api_key}"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(trip_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it "returns impossible route when route is not possible" do
      user = User.create(email: "Chris@email.com",
                  password: "1234",
                  password_confirmation: "1234")

      trip_params = ({
                      origin: "Denver,CO",
                      destination: "London, UK",
                      api_key: "#{user.api_key}"
                    })

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(trip_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:data][:attributes][:travel_time]).to eq("impossible route")
  end
end
