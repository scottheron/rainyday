# Place controller deals with the google places API, searching for a place and adding it to the 
# database
class PlaceController < ApplicationController
	before_action :is_authenticated?
	require 'rest-client'
	def new
		@place = Place.new
	end
	def create
		puts place_params
		new_place = Place.find_or_create_by(place_params) 
		redirect_to "/goal/new/#{new_place.id}"
	end
	def search
		if search_params
			@search_term = params[:q].to_s
			user = @current_user
			if zip_params[:code] == ''
				zipcode = user.zip.code
			else
				zipcode = zip_params[:code]
			end
			this_zip = Zip.find_or_create_by(code: zipcode) do |z|
				z.lat = zipcode.to_lat
				z.lng = zipcode.to_lon
			end
			lat = this_zip.lat.to_s
			lng = this_zip.lng.to_s
			results = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='+lat+','+lng+'&radius=10000&keyword='+@search_term+'&key='+ENV['GOOGLE_PLACES_KEY']
			@results = JSON.parse(results)
			@zip_code = zipcode
			puts results
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
		params.require(:place).permit(:name, :url, :address, :phone, :place_id)
	end
	def zip_params
		params.permit(:code)
	end
end
