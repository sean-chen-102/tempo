require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "user log out", :type => :request do
  # Sign out
  it "succeeds with log out process" do
    delete "/api/logout", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    data = JSON.parse(response.body) # grab the body of the server response
    status = data["status"]
    expect(status).to eq(1) # we should have a success
  end
end