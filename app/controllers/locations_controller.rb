class LocationsController < ApplicationController
	# GET method to get all locations from database   
	def index   
		@locations = Location.all   
	end   

	# GET method to get a location by slug  
	def show
		@location = Location.find_by_slug(params[:slug])
	end   

	# GET method for the new location form   
	def new   
		@location = Location.new   
	end   

	# POST method for processing form data   
	def create   
		@location = Location.new(location_params)   
		if @location.save   
		  flash[:notice] = 'Location added!'   
		  redirect_to root_path   
		else   
		  flash[:error] = 'Failed to edit Location!'   
		  render :new   
		end   
	end   

	# GET method for editing a location based on slug   
	def edit   
		@location = Location.find_by_slug(params[:slug])   
	end   

	# PUT method for updating in database a location based on slug   
	def update   
		@location = Location.find_by_slug(params[:slug])   
		if @location.update(location_params)   
		  flash[:notice] = 'Location updated!'   
		  redirect_to root_path   
		else   
		  flash[:error] = 'Failed to edit location!'   
		  render :edit   
		end   
	end   

	# DELETE method for deleting a location from database based on id   
	def destroy   
		@location = Location.find_by_slug(params[:slug])   
		if @location.destroy   
		  flash[:notice] = 'Location deleted!'   
		  redirect_to root_path   
		else   
		  flash[:error] = 'Failed to delete this location!'   
		  render :destroy   
		end   
	end   

	# FORECAST method for selecting forecasting options
	def forecast
		@location = Location.find_by_slug(params[:location_slug])  
		unless @location.nil? 
			render :forecast
			return
		end
		flash[:error] = 'Location does not exist' 
		redirect_to '/'
	end

	# FORECAST method for selecting forecasting options
	def fetch_forecast
		@location = Location.find_by_slug(params[:location_slug])
		unless @location.nil?
			@response = Weather::Forecast.by_location(@location)
			redirect_to controller: 'weather_forecasts', action: 'index', location_slug: @location.slug, start_date: params[:start_date], end_date: params[:end_date]
			return
		end
		flash[:error] = 'Location does not exist' 
		redirect_to '/'
	end


	private
	# we used strong parameters for the validation of params   
	def location_params   
		params.require(:location).permit(:lattitude, :longitude, :name)   
	end   
end
