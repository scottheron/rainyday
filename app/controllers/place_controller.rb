class PlaceController < ApplicationController
require 'rest-client'

	def index
		@places = Place.all
		@place = Place.new
	end

	def search
		if search_params
			@search_term = params[:q].to_s
			user = @current_user
			@zip_code = user.zip.code
			lat = user.zip.lat.to_s
			lng = user.zip.lng.to_s

			results = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='+lat+','+lng+'&radius=10000&keyword='+@search_term+'&key='+ENV['GOOGLE_PLACES_KEY']

			@results = JSON.parse(results)
		end
	end

	def search_params
		params.permit(:q)
	end
end
