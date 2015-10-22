class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

  	# Catch any undefined routes
  	def catch
		json_response = { status: -1, message: "Route not found" }.to_json
		respond_to do |format|
			format.json { render json: json_response }
		end
  	end

end
