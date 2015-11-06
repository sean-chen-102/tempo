require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "check token verification - ", :type => :request do
  # Verify the valid token
  it "succeeds with a valid token" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    email = user["email"]

    params = { "email": email, "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    token = data["token"]
    params = { "token": token }

    get "/api/verify_token", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Our returned User data should match the account we logged in with
    user2 = data["user"]
    expect(user["name"]).to eq(user2["name"])
    expect(user["email"]).to eq(user2["email"])
    expect(user["username"]).to eq(user2["username"])
    expect(user["id"]).to eq(user2["id"])
  end

  # Try to verify an invalid token
  it "fails with an invalid token" do
    token = "random"
    params = { "token": token }

    get "/api/verify_token", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

  # Try to verify with a missing token
  it "fails with the token missing" do
    params = { "random": "random" }

    get "/api/verify_token", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end
end