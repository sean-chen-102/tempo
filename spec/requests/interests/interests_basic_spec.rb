require 'rails_helper'

RSpec.describe "test basic interests functionality - ", :type => :request do

	### INTEREST CREATION ###
  it "creating a new interest" do
    # Create a new valid interest
    params = { "interest": { "name": "science" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    interest = data["interest"]
    expect(interest["name"]).to eq("science")

    # Create an interest with invalid attributes
    params = { "interest": { "name": "" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

	### EDIT INTEREST ###
  it "editing an interest" do
    # Create a new valid interest
    params = { "interest": { "name": "science" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interest = data["interest"]
    id = interest["id"]

    # Edit the interest
    params = { "name": "technology" }
    put "/api/interests/#{id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    interest_response = data["interest"]
    interest_response_id = interest_response["id"]
    expect(interest_response_id).to eq(id)
    expect(interest_response["name"]).to eq("technology")

    # Try to edit the interest with bad parameters - should fail
    params = { "name": "" }
    put "/api/interests/#{id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    # Try to edit an interest that doesn't exist - should fail
    params = { "name": "science" }
    put "/api/interests/0", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

	### GET INTEREST ###
  it "getting a single interest" do
    # Create a new valid interest
    params = { "interest": { "name": "science" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interest = data["interest"]
    id = interest["id"]

    # Get the interest
    get "/api/interests/#{id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    returned_interest = data["interest"]
    returned_id = returned_interest["id"]
    expect(returned_id).to eq(id)

    # Try to get an interest that doesn't exist - should fail
    get "/api/interests/0", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

	### GET ALL INTERESTS ###
  it "getting all interests" do
    # Get all interests - should be []
    get "/api/interests", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests = data["interests"]
    expect(interests).to eq([])

    # Create a new valid interest
    params = { "interest": { "name": "science" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Create a new valid interest
    params = { "interest": { "name": "technology" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Get all interests
    get "/api/interests", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests = data["interests"]
    expect(interests.length).to eq(2)
  end

	### DESTROY INTEREST ###
  it "deleting an interest" do
    # Create a new valid interest
    params = { "interest": { "name": "science" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interest = data["interest"]
    id = interest["id"]

    # Delete the interest
    delete "/api/interests/#{id}", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Get all interests - should be []
    get "/api/interests", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    interests = data["interests"]
    expect(interests).to eq([])

    # Try to delete an interest that doesn't exist - should fail
    delete "/api/interests/0", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

end