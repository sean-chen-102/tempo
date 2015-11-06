require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "user account creation - ", :type => :request do
  # Create a new user
  it "returns a valid user after account creation" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    id = user["id"]
    name = user["name"]
    username = user["username"]
    created_at = user["created_at"]
    updated_at = user["updated_at"]
    interests = user["interests"]
    custom_activities = user["custom_activities"]
    token = data["token"]

    expect(name).to eq("Bob")
    expect(username).to eq("bob")
    expect(interests).to eq([])
    expect(custom_activities).to eq([])
  end

  # Try creating a user with credentials that already exist in the database
  it "does not allow duplicate account creation" do
    # Create a unique User
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data1 = JSON.parse(response.body) # grab the body of the server response
    status1 = data1["status"]
    expect(status1).to eq(1) # we should have a success
    user1 = data1["user"]

    # Create a User with exactly the same fields
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data2 = JSON.parse(response.body) # grab the body of the server response
    status2 = data2["status"]
    expect(status2).to eq(-1) # we should have a failure
    user2 = data2["user"]

    # Create a User with a duplicate email
    params = { "user": { "name": "Tracy", "email": "bob@mail.com", "username": "tracy", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data2 = JSON.parse(response.body) # grab the body of the server response
    status2 = data2["status"]
    expect(status2).to eq(-1) # we should have a failure
    user2 = data2["user"]

    # Create a User with a duplicate username
    params = { "user": { "name": "Tracy", "email": "tracy@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data2 = JSON.parse(response.body) # grab the body of the server response
    status2 = data2["status"]
    expect(status2).to eq(-1) # we should have a failure
    user2 = data2["user"]

    # Create a User with a duplicate username and email
    params = { "user": { "name": "Tracy", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data2 = JSON.parse(response.body) # grab the body of the server response
    status2 = data2["status"]
    expect(status2).to eq(-1) # we should have a failure
    user2 = data2["user"]

    # Create a User with a duplicate name - should succeed
    params = { "user": { "name": "Bob", "email": "shelly@mail.com", "username": "shelly", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data2 = JSON.parse(response.body) # grab the body of the server response
    status2 = data2["status"]
    expect(status2).to eq(1) # we should have a success
    user2 = data2["user"]
  end

  # Create a User with the password confirmation included - should succeed
  it "without the password confirmation" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
  end

  # Create a User with mismatching password and password confirmation
  it "with mismatching password and password_confirmation" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "hi"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

  # Create a User with info that doesn't meet the validation standards
  it "with bad model validation credentials" do
    params = { "user": { "name": "", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "user": { "name": "Bob", "email": "", "username": "bob", "password": "password", "password_confirmation": "password"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "", "password": "password", "password_confirmation": "password"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "", "password": "", "password_confirmation": ""}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "user": { "name": "Bob", "email": "mail.com", "username": "bob", "password": "password", "password_confirmation": "password"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "user": { "name": "Bobasdfsdfasdfasfdsafdasdfasdfsdfsdf", "email": "mail.com", "username": "bob", "password": "password", "password_confirmation": "password"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "user": { "name": "Bob", "email": "mail.com", "username": "basdfasdfasdfasdfasdfasdfsadfob", "password": "password", "password_confirmation": "password"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "user": { "name": "Bob", "email": "b@mail.com", "username": "b2_-~r0%@!#ob", "password": "password", "password_confirmation": "password"}}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end

  # Send missing params attributes
  it "with missing params attributes" do
    params = { "user": { "name": "hi"} }
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end
end