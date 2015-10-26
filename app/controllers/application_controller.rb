class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception
	# TODO: this is probably not secure
	protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

	# Define hard-coded error messages
	class ErrorMessages
	  AUTHORIZATION_ERROR = "Error: you aren't authorized to perform this action."
	end

	# Catch any undefined routes
	def catch
		json_response = { "status": -1, "message": "Route not found" }.to_json
		respond_to do |format|
			format.json { render json: json_response }
      format.html { render :error_404 } # display custom 404 page if User enters URL wrong
		end
	end

	protected

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

	# Generates and returns a secure hash token based on username, email, password, and 
	# a randomly generated string
	def get_secure_token(username, email, password)
		random_string = SecureRandom.hex
		exp = Time.now.to_i + (24 * 7 * 3600) # expire 7 days from now

	  if username.nil?
	    username = User.find_by(email: email)
	  elsif email.nil?
	    email = User.find_by(username: username).email
	  end

	  payload = { username: username, email: email, password: password, random_string: SecureRandom.hex, exp: exp }

	  # IMPORTANT: set nil as password parameter
	  token = JWT.encode(payload, nil, 'none')

	  return token
	end

	# Returns a User if the passed in hash token contains a valid user session,
	# and nil otherwise
	def authenticate_token(token)
		# Set password to nil and validation to false otherwise this won't work
		decoded_token = JWT.decode token, nil, false
		username = decoded_token[:username]
		email = decoded_token[:email]
		password = decoded_token[:password]
		@user = User.find_by(username: username)

		if @user && @user.authenticate(password)
			return @user
		else
			return nil
		end
	end

	# Returns true if the given client_user has permission to perform the given action
	# on the User's data with the given id=user_id_to_modify
	def user_has_permission(client_user, user_id_to_modify)
		if client_user.id == user_id_to_modify # user's can modify their own data
			return true
		else
			return false
		end
	end

	# Returns a structured dictionary of User data
	def build_user_data(username)
	  user_data = {}
	  if not username.nil?
	    user = User.find_by(username: username)
	    user_data = { "id": user.id, "name": user.name, "username": user.username, "email": user.email }
	    interests = user.interests
	    interest_list = []

	    interests.each do |interest|
	      interest_list.append(interest.name)
	    end

	    user_data["interests"] = interest_list
	  end

	  return user_data
	end
end
