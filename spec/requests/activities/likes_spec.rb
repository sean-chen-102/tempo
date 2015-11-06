require 'rails_helper'

RSpec.describe "test activity rating system - ", :type => :request do

  before (:each) do
    # Create a User
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to equal(1)
    @token = data["user"]["token"]
    @user_id = data["user"]["id"]

    # Create an Activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to equal(1)
    @activity_id = data["activity"]["id"]
  end

  ### TEST THE LIKE COUNT OF THE ACTIVITY IS INITIALIZED TO 0 ###
  it "check that like count is 0 upon initializing" do
    get "/api/activities/#{@activity_id}/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to equal(1)
    
    like_count = data["like_count"]
    expect(like_count).to eq(0) # the like count should start at 0
  end

  ### TEST THE LIKE COUNT OF AN ACTIVITY THAT DOESN'T EXIST ###
  it "check the like count of a non-existent activity" do
    get "/api/activities/0/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to equal(-1)
  end


end