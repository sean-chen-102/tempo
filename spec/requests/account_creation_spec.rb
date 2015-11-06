require 'rails_helper'

# USAGE: bundle exec rspec

# POST /api/users/
# Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"user": {"name": "Jack Daniels", "email": "jack6@mail.com", "username": "jackD6", "password": "password", "password_confirmation": "password"}}' http://localhost:3000/api/users
RSpec.describe "account creation", :type => :request do
  it "returns a valid user after account creation" do
    params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    #=> params contains { "controller" => "user", "action" => "reset_password", "token" => 0 }

    data = JSON.parse(response.body)
    # puts "WE ARE HERE!"
    # puts "#{data}"

    expect(data["status"]).to equal(1)
  end
end