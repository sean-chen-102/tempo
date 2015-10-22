class UsersController < ApplicationController
  before_action :set_user, only: [:get_user, :create_user, :edit_user, :destroy_user, :get_user_interests, :get_user_custom_activities]

  # user authentication token idea: https://gist.github.com/josevalim/fb706b1e933ef01e4fb6

  # CUSTOM CODE

  # Create a User in the database for the given params
  # POST /api/users/
  # Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"user": {"name": "Jack Daniels", "email": "jack6@mail.com", "username": "jackD6", "password": "password", "password_confirmation": "password"}}' http://localhost:3000/api/users
  def create_user
    user_key = "user"
    username_key = "username"
    email_key = "email"
    name_key = "name"
    password_key = "password"
    password_confirmation_key = "password_confirmation"

    username = params[user_key][username_key]
    email = params[user_key][email_key]
    name = params[user_key][name_key]
    password = params[user_key][password]
    password_confirmation = params[user_key][password_confirmation_key]

    json_response = {}
    status = -1

    @user = User.new(user_params)
    # puts "Tried to create user: #{@user}"
    if @user.save 
      # puts "in @user.save"
      status = 1
      user_data = { "id": @user.id, "name": @user.name, "username": @user.username, "email": @user.email }
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
  def get_user
    if @user.nil? 
      json_response = { status: -1, errors: "User does not exist!"}.to_json
    else
      json_response = @user
    end

    respond_to do |format|
      format.json { render json: json_response }
    end
  end

  # Gets all Users from the database
  # GET '/api/users'
  def get_users
    json_response = User.all
    respond_to do |format|
      format.json { render json: json_response }
    end
  end

  # Edit the fields of a specified User
  # PUT /api/users/:id
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
  def destroy_user
    if @user.nil?
      json_response = { status: -1, errors: "User does not exist!"}.to_json
    else
      @user.destroy
      json_response = { status: 1 }.to_json
    end
    respond_to do |format|
      # format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { render json: json_response }
    end
  end

  # Return a JSON response with a list of given Interests of a specified User
  # GET '/api/users/:id/interests'
  def get_user_interests
    status = -1
    json_response = {}
    error_list = []
    user_id = params[:id]

    if not User.where(id: user_id).empty? # if the User exists
      interests = User.get_interests(user_id)

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
  def get_user_custom_activities
    status = -1
    json_response = {}
    error_list = []
    user_id = params[:id]

    if not User.where(id: user_id).empty? # if the User exists
      custom_activities = User.get_custom_activities(user_id)

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

  # Takes in an error hash of the form: { "username": ["has already been taken", "error 2"], "name": ["is too long"] }
  # and converts it to a list of readable errors, e.g. ["Error: username has already been taken.", "Error: username error 2.", 
  # "Error: name is too long."] and returns it.
  def process_save_errors(error_hash)
    error_list = []

    error_hash.each do |key|
      key_errors = error_hash[key]

      key_errors.each do |error|
        new_error = "Error: #{key} #{error}."
        error_list.append(new_error)
      end
    end

    return error_list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if not params[:id].nil? and params[:id].is_a? Integer
        @user = User.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      puts "SETTING USER_PARAMS"
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
