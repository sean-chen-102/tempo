require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "user password changing - ", :type => :request do
  # Successfully change a password and re-login
  it "succeeds with using email address" do
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

    # Change the password
    params = { "token": token, "old_password": "password", "new_password": "afternoon" }
    put "/api/users/#{id}/change_password", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Log in wih the new password
    params = { "email": email, "password": "afternoon" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    # Try to log in with the old password - should fail
    params = { "email": email, "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    # Try to change the password of a user that doesn't exist - should fail
    params = { "token": token, "old_password": "password", "new_password": "afternoon" }
    put "/api/users/0/change_password", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    # Create another account
    params = { "user": { "name": "Jen", "email": "jen@mail.com", "username": "jen", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
    id2 = data["user"]["id"]

    # Try to change the password of another User - should fail
    params = { "token": token, "old_password": "password", "new_password": "afternoon" }
    put "/api/users/#{id2}/change_password", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-2) # we should have a failure

    # Try to change the password to something that shouldn't be allowed - should fail
    params = { "token": token, "old_password": "afternoon", "new_password": "" }
    put "/api/users/#{id}/change_password", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end
end