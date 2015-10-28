class UsersController < ApplicationController
  before_action :set_user, only: [:get_user, :create_user, :edit_user, :destroy_user, :get_user_interests, :get_user_custom_activities]

  # user authentication token idea: https://gist.github.com/josevalim/fb706b1e933ef01e4fb6

  # CUSTOM CODE

  # Create a User in the database for the given params
  # POST /api/users/
  # Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"user": {"name": "Jack Daniels", "email": "jack6@mail.com", "username": "jackD6", "password": "password", "password_confirmation": "password"}}' http://localhost:3000/api/users
  def create_user
    json_response = {}
    status = -1

    @user = User.new(user_params)
    if @user.save 
      status = 1
      user_data = build_user_data(@user.username)
      token = get_secure_token(@user.username, @user.email, @user.password)
      json_response["user"] = user_data
    else
      error_list = process_save_errors(@user.errors)
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      format.json { render json: json_response }
    end
  end

  # Returns a JSON response with a specified User's information
  # GET '/api/users/:id'
  # Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users/1
  def get_user
    status = -1
    json_response = {}
    error_list = []

    if not @user.nil? # if the User exists
      status = 1
      user_data = { "id": @user.id, "name": @user.name, "username": @user.username, "email": @user.email }
      json_response["user"] = user_data
    else
      error_list.append("Error: user ##{params[:id]} does not exist.")
    end

    if status == -1
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: json_response }
    end
  end

  # Returns a JSON response with all Users from the database
  # GET '/api/users'
  # Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users
  def get_users
    status = -1
    json_response = {}
    error_list = []
    user_id = params[:id]
    @users = User.all
    user_list = []

    if not @users.empty? # if there are Users
      status = 1
      @users.each do |user|
        user_data = { "id": user.id, "name": user.name, "username": user.username, "email": user.email }
        user_data = user_data.as_json
        user_list.append(user_data)
      end

      json_response["users"] = user_list
    else
      error_list.append("Error: there are no users.")
    end

    if status == -1
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: json_response }
    end
  end

  # Edit the fields of a specified User
  # PUT /api/users/:id
  # TODO: update this API request
  def edit_user
    respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        # format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes specified User from database 
  # DELETE /api/users/:id
  # Testing via curl: curl -H "Content-Type: application/json" -X DELETE http://localhost:3000/api/users/13
  def destroy_user
    status = -1
    json_response = {}
    error_list = []

    if not @user.nil? # if the User exists
      @user.destroy # delete the User from the database
      status = 1
    else
      error_list.append("Error: user ##{params[:id]} does not exist.")
    end

    if status == -1
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      format.json { render json: json_response }
    end
  end

  # Return a JSON response with a list of given Interests of a specified User
  # GET '/api/users/:id/interests'
  # Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users/2/interests
  def get_user_interests
    status = -1
    json_response = {}
    error_list = []

    if not @user.nil? # if the User exists
      interests = User.get_interests(params[:id])

      if interests.length > 0
        status = 1
        json_response["interests"] = interests
      else
        error_list.append("Error: user ##{user_id} does not have any interests.")
      end
    else
      error_list.append("Error: user ##{params[:id]} does not exist.")
    end

    if status == -1
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: json_response }
    end
  end

  # Return a JSON response with a list of a User's Custom Activities
  # GET /api/users/:id/custom_activities
  # Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users/2/custom_activities
  def get_user_custom_activities
    status = -1
    json_response = {}
    error_list = []

    if not @user.nil? # if the User exists
      custom_activities = User.get_custom_activities(params[:id])

      if custom_activities.length > 0
        status = 1
        json_response["custom_activities"] = custom_activities
      else
        error_list.append("Error: user ##{user_id} does not have any custom activities.")
      end
    else
      error_list.append("Error: user ##{params[:id]} does not exist.")
    end

    if status == -1
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: json_response }
    end
  end

  # Create a User Interests in the database for the given params
  # POST /api/users/:id/interests
  # Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"interests":["science", "tech"]}' http://localhost:3000/api/users/1/interests
  def set_interests_for_user
    puts "HIT HERE"
    interests_key = "interests"
    json_response = {}
    status = -1
    interests = params[interests_key]
    user_id = params[:id]
    error_list = []
    successful_interests = []

    puts "id: #{user_id}"


    if not user_id.nil? and user_id.to_i != 0
      user = User.where(id: user_id)
      puts "user: #{user}"
      if not user.empty?
        puts "success"
        status = 1
        user = user.first
        user.interests = []
        user.save

        interests.each do |interest_name|
          interest_object = Interest.where(name: interest_name)
          if not interest_object.empty?
            interest_object = interest_object.first
            user.interests << interest_object
            user.save
            successful_interests << interest_name
          end
        end
      else
        error_list.append("Error: user ##{user_id} doesn't exist.")
      end
    end

    if status == 1
      json_response["interests_added"] = successful_interests
    else
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      format.json { render json: json_response }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if not params[:id].nil? and params[:id].respond_to?(:to_i)
        begin
          @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          @user = nil
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
