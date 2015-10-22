class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception
	# TODO: this is probably not secure
	protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

	# Catch any undefined routes
	def catch
		json_response = { "status": -1, "message": "Route not found" }.to_json
		respond_to do |format|
			format.json { render json: json_response }
      format.html { render :error_404 } # display custom 404 page if User enters URL wrong
		end
	end

end
