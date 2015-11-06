require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "user sign in - ", :type => :request do
  # Sign in with an email address
  it "succeeds with using email address" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    email = user["email"]

    params = { "email": email, "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
  end

  # Sign in with a username
  it "succeeds with using username" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    username = user["username"]

    params = { "username": username, "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
  end

  # Sign in with a both a username and email
  it "succeeds with using username and email at the same time" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    username = user["username"]
    email = user["email"]

    params = { "username": username, "email": email, "password": "password" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
  end

  # Sign in with bad credentials
  it "rejects bad credentials" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success

    user = data["user"]
    username = user["username"]
    email = user["email"]

    params = { "username": username, "password": "hi" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "email": email, "password": "hi" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "email": "hi", "password": "hi" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "username": "hi", "password": "hi" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "username": "hi" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure

    params = { "password": "hi" }
    post "/api/login", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(-1) # we should have a failure
  end
end