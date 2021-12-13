class WeatherForecastsController < ApplicationController
	# GET method to get all forecasts from database   
	def index   
		location = Location.find_by_slug(params[:location_slug])
		if not (location.blank? or params[:start_date].blank? or params[:end_date].blank?)
			start = params[:start_date].to_datetime
			end_date = params[:end_date].to_datetime
			if location.created_at.strftime("%Y%m%d").to_i > start.strftime("%Y%m%d").to_i or end_date < start
				render json: {
			      error: 'Invalid Query Params.'
			    }, status: :bad_request 
				return
			end
			forecasts = WeatherForecast.where("location_id = ? AND date >= ? AND date <= ?", location.id,start.all_day,end_date.all_day) 
			forecasts = forecasts_formatter(forecasts)
			if forecasts.empty?
				render json: {
			      error: 'No Data to show.'
			    }, status: :not_found 
				return
			else
				render status: :ok, json: forecasts
				return
			end
		else
			render json: {
			      error: 'Location Not Found'
			    }, status: :not_found 
			return
		end
	end

	def forecasts_formatter(forecasts)
		data = []
		forecasts.each do |x|
			obj = {}
			obj["date"] = x.date.strftime("%Y-%m-%d")
			obj["min-forecasted"] = x.min_forecasted
			obj["max-forecasted"] = x.max_forecasted
			data.append(obj)
		end
		return data
	end

  
end
