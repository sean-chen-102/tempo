require 'rails_helper'

RSpec.describe "test getting interests for activity - ", :type => :request do

  ### GET INTERESTS FOR THE ACTIVITY ###
  it "successfully get interests" do
    # Create a new valid activity
    params = { "activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!" } }
    post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    activity = data["activity"]
    id = activity["id"]

    # Get the interests for the activity - should be []
    get "/api/activities/#{id}/interests", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests = data["interests"]
    expect(interests).to eq([]) # we should have no interests yet

    # Try to get the interests for an activity that doesn't exist - should fail
    get "/api/activities/0/interests", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end
end