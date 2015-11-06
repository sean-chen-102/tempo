require 'rails_helper'

RSpec.describe "test getting users with interest - ", :type => :request do

  ### GET USERS WITH THE INTEREST ###
  it "successfully get users" do
    # Create a new valid interest
    params = { "interest": { "name": "science" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    interest = data["interest"]
    interest_id = interest["id"]
    interest_name = interest["name"]

    # Create another new valid interest
    params = { "interest": { "name": "technology" } }
    post "/api/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    interest2 = data["interest"]
    interest_id2 = interest2["id"]
    interest_name2 = interest2["name"]

    # Create a new User
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data1 = JSON.parse(response.body) # grab the body of the server response
    status1 = data1["status"]
    expect(status1).to eq(1) # we should have a success
    user1 = data1["user"]
    user1_id = user1["id"]
    user1_name = user1["name"]
    user1_token = user1["token"]

    # Create another new User
    params = { "user": { "name": "Sam", "email": "sam@mail.com", "username": "sam", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data2 = JSON.parse(response.body) # grab the body of the server response
    status2 = data2["status"]
    expect(status2).to eq(1) # we should have a success
    user2 = data2["user"]
    user2_id = user2["id"]
    user2_name = user2["name"]
    user2_token = user2["token"]

    # Create another new User
    params = { "user": { "name": "Boy", "email": "boy@mail.com", "username": "boy", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data3 = JSON.parse(response.body) # grab the body of the server response
    status3 = data3["status"]
    expect(status3).to eq(1) # we should have a success
    user3 = data3["user"]
    user3_id = user3["id"]
    user3_name = user3["name"]
    user3_token = user3["token"]

    # Add both interests for the first User
    params = { "interests": [interest_name, interest_name2], "token": user1_token }
    put "/api/users/#{user1_id}/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Add one interest for the second User
    params = { "interests": [interest_name], "token": user2_token }
    put "/api/users/#{user2_id}/interests", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Get the Users with interest_name
    get "/api/interests/#{interest_id}/users", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    users = data["users"]

    names_of_users = []
    users.each do |user|
        names_of_users.append(user["name"])
    end

    expect(names_of_users).to include(user1_name, user2_name) # the first 2 users share the same interest

    # Try to get the Users with an interest that doesn't exist - should fail
    get "/api/interests/0/users", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a success
  end
end