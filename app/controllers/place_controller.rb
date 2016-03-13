class PlaceController < ApplicationController
	before_action :is_authenticated?, except: [:index]

require 'rest-client'

	def index
		@places = Place.all
		@place = Place.new
	end

	def search
		if search_params
			search_term = params[:q]

			results = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types='+search_term+'&key='+ENV['GOOGLE_PLACES_KEY']
			@results = JSON.parse(results)
		end
	end

	def search_params
		params.permit(:q)
	end
end
