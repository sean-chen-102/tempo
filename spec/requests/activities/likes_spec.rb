require 'rails_helper'

RSpec.describe "test activity rating system - ", :type => :request do

  before (:each) do
    # Create a User
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    @token = data["user"]["token"]
    @user_id = data["user"]["id"]

    # Create an Activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    @activity_id = data["activity"]["id"]
  end

  ### TEST THE LIKE COUNT OF THE ACTIVITY IS INITIALIZED TO 0 ###
  it "check that like and dislike count is 0 upon initializing" do
    get "/api/activities/#{@activity_id}/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the like count should start at 0
    expect(dislike_count).to eq(0) # the dislike count should start at 0
  end

  ### TEST THE LIKE COUNT OF AN ACTIVITY THAT DOESN'T EXIST ###
  it "check the like count of a non-existent activity" do
    get "/api/activities/0/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(-1)
  end

  ### TEST THE LIKE COUNT OF AN ACTIVITY AFTER LIKING ###
  it "check the like count after liking the activity" do
    # Like the activity
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/like", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(1) # the activity should have only been liked once
    expect(dislike_count).to eq(0) # the activity shouldn't have been disliked yet

    # Try to like the activity again - should reset it to zero
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/like", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have its likes decremented
    expect(dislike_count).to eq(0) # the activity shouldn't have been disliked yet

    # Check the like count
    get "/api/activities/#{@activity_id}/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the like count should have stayed at 0
    expect(dislike_count).to eq(0) # the dislike count should have stayed at 0

    # Try to like the activity again - should increment by 1
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/like", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(1) # the activity should have its likes decremented
    expect(dislike_count).to eq(0) # the activity shouldn't have been disliked yet

    # Delete the User to make sure lazy deletion happens
    params = { "token": @token }
    delete "/api/users/#{@user_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Check the like count
    get "/api/activities/#{@activity_id}/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the like count should have been reset to 0
    expect(dislike_count).to eq(0) # the dislike count should have stayed at 0
  end

  ### TEST LIKING WITH BAD INPUT ###
  it "like with bad input" do
    # Like the activity with a bad token - should fail
    params = { "token": "bad" }
    put "/api/activities/#{@activity_id}/like", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(-2)

    # Like a non-existent activity - should fail
    params = { "token": @token }
    put "/api/activities/0/like", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(-1)
  end

  ### TEST THE LIKE COUNT OF AN ACTIVITY AFTER DISLIKING IT ###
  it "check the like count after disliking the activity" do
    # Dislike the activity
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/dislike", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have no like count
    expect(dislike_count).to eq(1) # the activity should have been disliked once

    # Try to dislike the activity again - should reset it to zero
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/dislike", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have no like count
    expect(dislike_count).to eq(0) # the activity should have dislike count reset to zero

    # Check the like count
    get "/api/activities/#{@activity_id}/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have no like count
    expect(dislike_count).to eq(0) # the activity should have no dislike count

    # Try to dislike the activity again - should add one to it
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/dislike", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have no like count
    expect(dislike_count).to eq(1) # the activity should have had its dislike count incremented

    # Delete the User to make sure lazy deletion happens
    params = { "token": @token }
    delete "/api/users/#{@user_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Check the like count after user deletion
    get "/api/activities/#{@activity_id}/like_count", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have no like count
    expect(dislike_count).to eq(0) # the activity should have no dislike count
  end

  ### TEST DISLIKING WITH BAD INPUT ###
  it "dislike with bad input" do
    # Dislike the activity with a bad token - should fail
    params = { "token": "bad" }
    put "/api/activities/#{@activity_id}/dislike", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(-2)

    # Dislike a non-existent activity - should fail
    params = { "token": @token }
    put "/api/activities/0/dislike", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(-1)
  end

  ### TEST THE LIKE COUNT OF AN ACTIVITY AFTER DISLIKING AND LIKING IT ###
  it "check the like count after disliking and liking the activity multiple times" do
    # Dislike the activity
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/dislike", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have no like count
    expect(dislike_count).to eq(1) # the activity should have 1 dislike count

    # Try to like the activity
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/like", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(1) # the activity should have 1 like count
    expect(dislike_count).to eq(0) # the activity should have no dislike count

    # Dislike the activity again
    params = { "token": @token }
    put "/api/activities/#{@activity_id}/dislike", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body)
    expect(data["status"]).to eq(1)
    like_count = data["like_count"]
    dislike_count = data["dislike_count"]
    expect(like_count).to eq(0) # the activity should have no like count
    expect(dislike_count).to eq(1) # the activity should have 1 dislike count
  end
end