require 'rails_helper'

describe "Registration" do
  it "can register a new user" do
    user_params = ({
                    email: 'Chris@email.com',
                    password: '1234',
                    password_confirmation: '1234'
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("users")
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to be_a(String)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to be_a(String)
    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes][:api_key]).to be_a(String)

    created_user = User.last
    expect(created_user.email).to eq(user_params[:email])
  end

  it "receives a 401 error if it does not include required params" do
    user_params = ({
                    email: 'Chris@email.com',
                    password: '1234'
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it "receives a 401 error if required params are incorrect" do
    user_params = ({
                    email: 'Chris@email.com',
                    password: '1234',
                    password_confirmation: '123'
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end
