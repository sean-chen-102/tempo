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

	# An AuthToken class for encoding and decoding JWT authorization tokens.
	class AuthToken
		# grab our application's secret code
		@hmac_secret = Rails.application.secrets.secret_key_base
		@algorithm = 'HS256'

		# Returns an encoded JWT token.
		def self.encode(payload, exp=7.days.from_now)
			# set our expiration time
			exp = exp.to_i
			payload[:exp] = exp

			# encode and return our token
			return JWT.encode(payload, @hmac_secret, @algorithm)
		end

		# Returns the payload of the given JWT token. If the token can't be validated, 
		# it returns nil.
		def self.decode(token)
			begin
				# try to decode the token
			  decoded_token = JWT.decode(token, @hmac_secret, true, { algorithm: @algorithm })
			rescue JWT::ExpiredSignature
			  # the token has expired, they should be logged out and asked to log back in
			  decoded_token = nil
			end

			return decoded_token
		end
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

	# Generates and returns a signed hash token based on the user_id and a 
	# randomly generated string.
	def get_signed_token(user_id)
		random_string = SecureRandom.hex
	  payload = { user_id: user_id, random_string: random_string }

	  # generate the signed token
	  token = AuthToken.encode(payload)

	  return token
	end

	# Returns an authenticated User if the passed in hash token contains a valid user session,
	# and nil otherwise.
	def authenticate_token(token)
		# Set password to nil and validation to false otherwise this won't work
		decoded_token =  AuthToken.decode(token)

		if decoded_token.nil? # the token was not valid
			return nil
		end

		user_id = decoded_token[:user_id]
		@user = User.find_by(id: user_id)

		if not @user.nil?
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
