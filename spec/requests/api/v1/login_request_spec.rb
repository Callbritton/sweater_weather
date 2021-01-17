require 'rails_helper'

describe "Login" do
  before :each do
    User.destroy_all
  end

  it "can log in a user" do
    user = User.create(email: "Chris@email.com",
                       password: "1234",
                       password_confirmation: "1234")

    user_params = ({
                    email: "#{user.email}",
                    password: "#{user.password}",
                    password_confirmation: "#{user.password_confirmation}"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(200)

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

    expect(parsed[:data][:attributes][:email]).to eq(user.email)
    expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
    expect(parsed[:data][:id].to_i).to eq(user.id)
  end

  it "fails to login without email present" do
    user = User.create(email: "Chris@email.com",
                       password: "1234",
                       password_confirmation: "1234")

    user_params = ({
                    password: "#{user.password}",
                    password_confirmation: "#{user.password_confirmation}"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(parsed).to eq({:errors => "Bad Credentials"})
  end

  it "fails to login without password present" do
    user = User.create(email: "Chris@email.com",
                       password: "1234",
                       password_confirmation: "1234")

    user_params = ({
                    email: "#{user.email}",
                    password_confirmation: "#{user.password_confirmation}"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(parsed).to eq({:errors => "Bad Credentials"})
  end

  it "fails to login if user enters incorrect password" do
    user = User.create(email: "Chris@email.com",
                       password: "1234",
                       password_confirmation: "1234")

    user_params = ({
                    email: "#{user.email}",
                    password: "wrongpassword",
                    password_confirmation: "wrongpassword"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(parsed).to eq({:errors => "Bad Credentials"})
  end
end
