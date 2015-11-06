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

	### GET INTEREST ###

	### GET ALL INTERESTS ###

	### DESTROY INTEREST ###
end