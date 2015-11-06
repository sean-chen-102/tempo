require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "get and set user custom activities - ", :type => :request do
  # Successfully get and set the user custom activities
  it "succeeds with getting and setting user custom activities" do
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
    custom_activities = user["custom_activities"]
    expect(custom_activities).to eq([])

    # Get all user custom_activities - should be []
    params = { "token": token }
    get "/api/users/#{id}/custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    custom_activities = data["custom_activities"]
    expect(custom_activities).to eq([])

    # Add a custom activity to the database
    params = {"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": token}
    post "/api/users/#{id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Get all the user custom_activities
    params = { "token": token }
    get "/api/users/#{id}/custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    custom_activities = data["custom_activities"]
    
    custom_activity = custom_activities[0]
    title = custom_activity["title"]
    expect(title).to eq("Title")

    # Get all the user custom_activities with a bad token - should fail
    params = { "token": "bad" }
    get "/api/users/#{id}/custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-2) # we should have a failure
    custom_activities = data["custom_activities"]

    # Get all the user custom_activities with a missing token - should fail
    params = { "other": "bad" }
    get "/api/users/#{id}/custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-2) # we should have a failure
    custom_activities = data["custom_activities"]

    # Get all the user custom_activities for a user that doesn't exist - should fail
    params = { "token": token }
    get "/api/users/0/custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
    custom_activities = data["custom_activities"]

  end
end