require 'rails_helper'

RSpec.describe "test basic users functionality - ", :type => :request do

	### USER CREATION ###

	### EDIT USER ###
  it "succeeds with using email address" do
    # Create an account
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    email = user["email"]

    # Edit some account info
    params = { "email": "bobby@email.com", "name": "Bobby" }
    put "/api/users/#{user['id']}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Make sure the info was changed
    user = data["user"]
    expect(user["email"]).to eq("bobby@email.com")
    expect(user["name"]).to eq("Bobby")
    expect(user["username"]).to eq("bob")

    # Try signing in with new email
    params = { "email": user["email"], "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Try signing in with old username
    params = { "username": "bob", "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Try signing in with old email - should fail
    params = { "email": "bob@mail.com", "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

	### GET USER ###

  it "getting a single user" do
    # Create an account
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    id = user["id"]

    # Get the user
    get "/api/users/#{id}", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Verify that the user data is consistent
    user = data["user"]
    expect(id).to eq(user["id"])
    expect(user["name"]).to eq("Bob")
    expect(user["email"]).to eq("bob@mail.com")
    expect(user["username"]).to eq("bob")

    # Try and get a user that doesn't exist
    get "/api/users/hah", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a success

    # Try and get a user that doesn't exist
    get "/api/users/-1", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a success

    # Try and get a user that doesn't exist
    get "/api/users/0", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a success
  end

	### GET ALL USERS ###

	### DESTROY USER ###

end