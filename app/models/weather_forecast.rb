class WeatherForecast < ActiveRecord::Base   
	belongs_to :location
	validates :date, presence: true
	validates :min_forecasted, presence: true 
	validates :max_forecasted, presence: true
end   
