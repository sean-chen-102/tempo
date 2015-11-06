require 'rails_helper'

# USAGE: bundle exec rspec

# POST /api/users/
# Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"user": {"name": "Jack Daniels", "email": "jack6@mail.com", "username": "jackD6", "password": "password", "password_confirmation": "password"}}' http://localhost:3000/api/users
RSpec.describe "account creation", :type => :request do
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
end