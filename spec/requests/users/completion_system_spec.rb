require 'rails_helper'

RSpec.describe "test completing activities and custom_activities - ", :type => :request do

    before (:each) do
        params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
        post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)
        @token = data["user"]["token"]
        @user_id = data["user"]["id"]

        params = {"activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!"}}
        post "/api/activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)
        @activity = data["activity"]

        params = {"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token":@token}
        post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)
        @custom_activity = data["custom_activity"]

    end

    ### COMPLETE AND GET ACTIVITIES ###
    it "creates activity and completes it" do
        params = {"user_id": @user_id, "token": @token}
        put "/api/activities/#{@activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)

        params = {"token": @token}
        get "/api/users/#{@user_id}/completed_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)
        expect(data["completed_activities"][0]).to eq(@activity["id"])
    end

    it "attempts to complete activity (activity does not exist)" do
        params = {"user_id": @user_id, "token": @token}
        put "/api/activities/999999999999/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-1)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: activity does not exist")
    end

    it "attempts to complete activity (token does not exist)" do
        params = {"user_id": @user_id}
        put "/api/activities/#{@activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    it "attempts to complete activity (token is bad)" do
        params = {"user_id": @user_id, "token": "BAD TOKEN"}
        put "/api/activities/#{@activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    it "attempts to complete activity (user does not exist)" do
        params = {"user_id": 999999999999, "token": @token}
        put "/api/activities/#{@activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-1)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: user_id is not valid")
    end

    it "attempts to get completed_activities (user is null)" do
        params = {"token": @token}
        get "/api/users/999999999999/completed_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-1)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: user does not exist")
    end

    it "attempts to get completed_activities (token is null)" do
        params = {}
        get "/api/users/#{@user_id}/completed_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    it "attempts to get completed_activities (token is bad)" do
        params = {"token": "BAD TOKEN"}
        get "/api/users/#{@user_id}/completed_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    ### TEST ACTIVITY LAZY DELETION ###
    it "should delete destroyed activities from user's completed_activities list" do
        params = {"user_id": @user_id, "token": @token}
        put "/api/activities/#{@activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)

        delete "/api/activities/#{@activity["id"]}", "", { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)

        params = {"token": @token}
        get "/api/users/#{@user_id}/completed_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)
        expect(data["completed_activities"].length).to eq(0)
    end

    ### COMPLETE AND GET CUSTOM_ACTIVITIES ###
    it "creates custom_activity and completes it" do
        params = {"user_id": @user_id, "token": @token}
        put "/api/custom_activities/#{@custom_activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)

        params = {"token": @token}
        get "/api/users/#{@user_id}/completed_custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)
        expect(data["completed_custom_activities"][0]).to eq(@custom_activity["id"])
    end

    it "attempts to complete custom_activity (custom_activity does not exist)" do
        params = {"user_id": @user_id, "token": @token}
        put "/api/custom_activities/999999999999/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-1)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: activity does not exist")
    end

    it "attempts to complete custom_activity (token does not exist)" do
        params = {"user_id": @user_id}
        put "/api/custom_activities/#{@custom_activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    it "attempts to complete custom_activity (token is bad)" do
        params = {"user_id": @user_id, "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MTcyLCJyYW5kb21fc3RyaW5nIjoiZmY0NWM5NTA4NDdmOGFkYjgxMjA2NTc2ZGU0NGQxNWUiLCJleHAiOjE0NDc0NzMwNzN9.dAn-gqtjTLxJg6sHJ6yT6ktQ-umiTzuDz1c-QzCCiLQ"}
        put "/api/custom_activities/#{@custom_activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    it "attempts to complete custom_activity (user does not exist)" do
        params = {"user_id": 999999999999, "token": @token}
        put "/api/custom_activities/#{@custom_activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-1)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: user_id is not valid")
    end

    it "attempts to get completed custom_activities (user does not exist)" do
        params = {"token": @token}
        get "/api/users/999999999/completed_custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-1)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: user does not exist")
    end

    it "attempts to get completed custom_activities (token is null)" do
        params = {}
        get "/api/users/#{@user_id}/completed_custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    it "attempts to get completed custom_activities (token is bad)" do
        params = {"token": "BAD TOKEN"}
        get "/api/users/#{@user_id}/completed_custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(-2)
        errors = data["errors"]
        expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
    end

    ### TEST CUSTOM_ACTIVITY LAZY DELETION ###
    it "should delete destroyed custom_activities from user's completed_activities list" do
        params = {"user_id": @user_id, "token": @token}
        put "/api/custom_activities/#{@custom_activity["id"]}/complete", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)

        params = {"token": @token}
        delete "/api/users/#{@user_id}/custom_activities/#{@custom_activity["id"]}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)

        params = {"token": @token}
        get "/api/users/#{@user_id}/completed_custom_activities", params.as_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        data = JSON.parse(response.body)
        expect(data["status"]).to equal(1)
        expect(data["completed_custom_activities"].length).to eq(0)
    end

end