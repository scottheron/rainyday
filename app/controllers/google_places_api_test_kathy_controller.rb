class GooglePlacesApiTestKathyController < ApplicationController
	require 'rest-client'

	def index
		lat = -33.8670522
		lng = 151.1957362
		search_term = restaurant
		radius = 500

		@response = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='+lat+','+lng+'&radius='+radius+'&type='+search_term+'&key='+ENV['GOOGLE_PLACES_KEY']

		#this is a test link that works
		# @response = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key='+ENV['GOOGLE_PLACES_KEY']
	end
end
