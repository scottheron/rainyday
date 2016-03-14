class PlaceController < ApplicationController
	before_action :is_authenticated?, except: [:index]

require 'rest-client'

	def new
		@place = Place.new
	end

	def create
		Place.create place_params do |p|
			# p.user_id = @current_user.id
			# p.google_id = params[:google_id]
		end
		redirect_to goal_path
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


	def show
		#take param
		place_id = params[:place].to_s
		details = RestClient.get 'https://maps.googleapis.com/maps/api/place/details/json?placeid='+place_id+'&key='+ENV['GOOGLE_PLACES_KEY']
		@details = JSON.parse(details)
	end

	def search_params
		params.permit(:q)
	end

	def place_params
		params_require(:place)
	end
end
