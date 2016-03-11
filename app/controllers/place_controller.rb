class PlaceController < ApplicationController
require 'rest-client'

	def index
		@places = Place.all
		@place = Place.new
	end

	def search
		puts search_params
		puts '----------------------------'

		if search_params
			search_term = params[:q]

			results = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types='+search_term+'&key='+ENV['GOOGLE_PLACES_KEY']
			@results = JSON.parse(results)
			# render json: @results
		end
	end

	def search_params
		params.permit(:q)
	end
end
