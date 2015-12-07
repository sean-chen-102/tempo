require 'rails_helper'

RSpec.describe "test basic activities functionality - ", :type => :request do

  ### ACTIVITY CREATION ###
  it "creating a new activity" do
    # Create a new valid activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Create an activity with invalid attributes
    params = { "activity": {"title": "Title asldfkj sdflk asdfl;k aslfdk asldf kas;lfk asdfl kd", "completion_time": 70, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

  ### EDIT ACTIVITY ###
  it "editing an activity" do
    # Create a new valid activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    activity = data["activity"]
    id = activity["id"]

    # Edit the activity
    params = { "title": "Different", "completion_time": 22, "content_type": "video", "link": "https://www.yahoo.com", "content": "Something else!" }
    put "/api/activities/#{id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Try and make a bad edit to the activity - should fail
    params = { "title": "Different", "completion_time": 70, "content_type": "video", "link": "https://www.yahoo.com", "content": "Something else!" }
    put "/api/activities/#{id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    # Try and edit an activity that doesn't exist - should fail
    params = { "title": "Different", "completion_time": 70, "content_type": "video", "link": "https://www.yahoo.com", "content": "Something else!" }
    put "/api/activities/0", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

  end

  ### GET ACTIVITY ###
  it "getting a single activity" do
    # Create a new valid activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    activity = data["activity"]
    id = activity["id"]

    # Get the activity
    get "/api/activities/#{id}", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    returned_activity = data["activity"]
    returned_activity_id = returned_activity["id"]

    # The returned activity should match the one we created
    expect(id).to eq(returned_activity_id)

    # Try and get an activity that doesn't exist - should fail
    get "/api/activities/0", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

  ### GET ALL ACTIVITIES ###
  it "getting all activities" do
    # Get all of the activities - should be []
    get "/api/activities", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activities = data["activities"]
    expect(activities).to eq([])

    # Create a new valid activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    params = { "activity": {"title": "Title", "completion_time": 20, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    params = { "activity": {"title": "Title", "completion_time": 30, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Get all of the activities
    get "/api/activities/", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activities = data["activities"]
    expect(activities.length).to eq(0) # the number of activities should equal to 0 because we have no interests selected

    # Get activities filtered by time=10
    params = { "time": 10 }
    get "/api/activities/", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activities = data["activities"]
    expect(activities.length).to eq(0)

    # Get activities filtered by time=20
    params = { "time": 20 }
    get "/api/activities/", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activities = data["activities"]
    expect(activities.length).to eq(0)

    # Get activities filtered by time=20 and interests = "news" or "fitness"
    params = { "time": 20, "interests": ["news", "fitness"] }
    get "/api/activities/", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activities = data["activities"]
    expect(activities.length).to eq(0)

    # Create a user to test CustomActivity inclusion
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    user_id = data["user"]["id"]
    token = data["user"]["token"]

    # Get activities and custom_activities filtered by time=20 and interests = "news" or "fitness"
    params = { "token": token, "user_id": user_id, "time": 20, "interests": ["news", "fitness"] }
    get "/api/activities/", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activities = data["activities"]
    expect(activities.length).to eq(0)
  end

  ### DESTROY ACTIVITY ###
  it "deleting an activity" do
    # Create a new valid activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    activity = data["activity"]
    id = activity["id"]

    # Delete the activity
    delete "/api/activities/#{id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Get all of the activities - should be []
    get "/api/activities", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activities = data["activities"]
    expect(activities).to eq([])

    # Try to delete an activity that doesn't exist - should fail
    delete "/api/activities/0", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end


end