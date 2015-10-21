class PagesController < ActionController::Base
	respond_to :json
	def index 
		@data = [
				{:title => "Title One ", :content => "Content One "},
				{:title => "Title Two ", :content => "Content Two "},
				{:title => "Title Three ", :content => "Content Three "}
			];
		render :json => @data 
	end
	
end

# for home page routing - test


def home
end
# for testing views before pushing them to Backbone.js
