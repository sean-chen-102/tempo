require 'rails_helper'

RSpec.describe "test basic custom activities functionality - ", :type => :request do


	before (:each) do
		params = { "user": { "name": "Bob", "email": "bob@mail.com", "username": "bob", "password": "password", "password_confirmation": "password" }}
    	post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    	data = JSON.parse(response.body)

    	expect(data["status"]).to equal(1)

    	@token = data["user"]["token"]
    	@user_id = data["user"]["id"]

    	params = { "user": { "name": "Bill", "email": "bill@mail.com", "username": "bill", "password": "password", "password_confirmation": "password" }}
    	post "/api/users", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    	data = JSON.parse(response.body)

    	expect(data["status"]).to equal(1)

    	@token2 = data["user"]["token"]
    	@user_id2 = data["user"]["id"]
	end

	### CUSTOM_ACTIVITY CREATION ###
	it "creates the custom_activity" do
		params = {"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)

		custom_activity = data["custom_activity"]
		expect(custom_activity["title"]).to eq("Title")
		expect(custom_activity["content"]).to eq("Lorem ipsum content here!")
		expect(custom_activity["completion_time"]).to eq(10)
	end

	it "attempts to create custom_activity (fails for user not found)" do
		params = {"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/999999999999999/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: user #999999999999999 doesn't exist.")
	end

	it "attempts to create custom_activity (fails for token == null)" do
		params = {"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!"}}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-2)

		errors = data["errors"]
		expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
	end

	it "attempts to create custom_activity (fails for token is bad)" do

		params = {"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": "HI"}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-2)

		errors = data["errors"]
		expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
	end

	it "attempts to create custom_activity (custom_activity params are bad)" do
		params = {"custom_activity": {"title": "Title", "completion_time": "BAD COMPLETION TIME", "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)

		errors = data["errors"]
		expect(errors[0]).to eq("Error: completion_time is not a number.")
	end

	### EDIT CUSTOM_ACTIVITY ###
	it "creates and edits custom_activity" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"custom_activity": {"title": "Title 2", "completion_time": 30, "content": "Lorem ipsum content here!"}, "token": @token}
		put "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)

		custom_activity = data["custom_activity"]
		expect(custom_activity["title"]).to eq("Title 2")
		expect(custom_activity["content"]).to eq("Lorem ipsum content here!")
		expect(custom_activity["completion_time"]).to eq(30)
	end

	it "attempts to edit custom_activities (fails because user doesn't exist)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"custom_activity": {"title": "Title 2", "completion_time": 30, "content": "Lorem ipsum content here!"}, "token": @token}
		put "/api/users/999999999999999/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: user #999999999999999 doesn't exist.")
	end

	it "attempts to edit custom_activities (fails because token doesn't exist)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"custom_activity": {"title": "Title 2", "completion_time": 30, "content": "Lorem ipsum content here!"}}
		put "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-2)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
	end

	it "attempts to edit custom_activities (fails because token is bad)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"custom_activity": {"title": "Title 2", "completion_time": 30, "content": "Lorem ipsum content here!"}, "token": "HI"}
		put "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-2)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
	end

	it "attempts to edit custom_activities (fails because custom_activity doesn't exist)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"custom_activity": {"title": "Title 2", "completion_time": 30, "content": "Lorem ipsum content here!"}, "token": @token}
		put "/api/users/#{@user_id}/custom_activities/999999999999", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: custom activity #999999999999 doesn't exists.")
	end

	it "attempts to edit custom_activities (fails because custom_activity doesn't belong to user)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token2}
		post "/api/users/#{@user_id2}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"custom_activity": {"title": "Title 2", "completion_time": 30, "content": "Lorem ipsum content here!"}, "token": @token}
		put "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: custom activity ##{custom_activity_id} doesn't belong to user ##{@user_id}.")
	end

	it "attempts to edit custom_activities (fails because custom_activity params are bad)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"custom_activity": {"title": "Title 2", "completion_time": "BAD COMPLETION TIME", "content": "Lorem ipsum content here!"}, "token": @token}
		put "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: completion_time is not a number.")
	end

	### GET ALL CUSTOM_ACTIVITIES ###
	it "creates and gets all custom_activities" do 
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)

		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)

		get "/api/custom_activities", "", { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		expect(data["custom_activities"].length).to equal(2)
	end

	it "attempts to get all custom_activities (fails because there are none)" do
		get "/api/custom_activities", "", { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		expect(data["errors"][0]).to eq("Error: there are no custom_activities")
	end

	### DESTROY CUSTOM_ACTIVITY ###
	it "creates and deletes a custom_activity" do
		params = {"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"token": @token}
		delete "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
		expect(data["status"]).to equal(1)
	end

	it "attempts to destroy custom_activities (fails because user doesn't exist)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"token": @token}
		delete "/api/users/999999999999999/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: user #999999999999999 doesn't exist.")
	end

	it "attempts to destroy custom_activities (fails because token doesn't exist)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {}
		delete "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-2)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
	end

	it "attempts to destroy custom_activities (fails because token is bad)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"token": "HI"}
		delete "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-2)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: you aren't authorized to perform this action.")
	end

	it "attempts to destroy custom_activities (fails because custom_activity doesn't exist)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token}
		post "/api/users/#{@user_id}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"token": @token}
		delete "/api/users/#{@user_id}/custom_activities/999999999999", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: custom activity #999999999999 doesn't exists.")
	end

	it "attempts to destroy custom_activities (fails because custom_activity doesn't belong to user)" do
		params = {"custom_activity": {"title": "Title 1", "completion_time": 10, "content": "Lorem ipsum content here!"}, "token": @token2}
		post "/api/users/#{@user_id2}/custom_activities", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(1)
		custom_activity_id = data["custom_activity"]["id"]

		params = {"token": @token}
		delete "/api/users/#{@user_id}/custom_activities/#{custom_activity_id}", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		data = JSON.parse(response.body)

		expect(data["status"]).to equal(-1)
		errors = data["errors"]
		expect(errors[0]).to eq("Error: custom activity ##{custom_activity_id} doesn't belong to user ##{@user_id}.")
	end

end