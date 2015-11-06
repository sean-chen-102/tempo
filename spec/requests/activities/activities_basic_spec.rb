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

    params = { "title": "Different", "completion_time": 22, "content_type": "video", "link": "https://www.yahoo.com", "content": "Something else!" }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success


  end

	### GET ACTIVITY ###

	### GET ALL ACTIVITYS ###

	### DESTROY ACTIVITY ###

end