require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "get and set user interests - ", :type => :request do
  # Successfully get and set the user interests
  it "succeeds with getting and setting user interests" do
    # Creat an account
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    email = user["email"]
    token = user["token"]
    id = user["id"]
    interests = user["interests"]
    expect(interests).to eq([])

    # Get all user interests - should be []
    params = { "token": token }
    get "/api/users/#{id}/interests", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests = data["interests"]
    expect(interests).to eq([])

    # Add an interest to the database
    params = { "interest": { "name": "science"} }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Add an interest to the database
    params = { "interest": { "name": "technology"} }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Get all the interests in the database
    get "/api/interests", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests = data["interests"]

    user_interests = []
    interests.each do |interest|
      user_interests.append(interest["name"])
    end

    # Set user interests to all of the interests in the database
    params = { "interests": user_interests, "token": token }
    put "/api/users/#{id}/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests2 = data["interests_added"]
    expect(interests2).to eq(user_interests)

    # Get all user interests - should be all of the interests in the database
    params = { "token": token }
    get "/api/users/#{id}/interests", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests2 = data["interests"]

    interest_names = []
    interests2.each do |interest|
        interest_names.append(interest["name"])
    end

    expect(interest_names).to eq(user_interests)

    # Get all user interests with a bad token - should fail
    params = { "token": "bad" }
    get "/api/users/#{id}/interests", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-2) # we should have a failure

    # Get all user interests without submitting a token - should fail
    params = { "other": "bad" }
    get "/api/users/#{id}/interests", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-2) # we should have a failure

    # Get all user interests for a user that doesn't exist - should fail
    params = { "other": "bad" }
    get "/api/users/0/interests", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    # Set user interests without 'interests' in params - should succeed
    params = { "token": token }
    put "/api/users/#{id}/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a failure
    expect(data["interests_added"]).to eq([])

    # Set user interests without 'token' in params - should fail
    params = { "interests": interests }
    put "/api/users/#{id}/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-2) # we should have a failure

  end
end