class AddForecastDataToDb
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(location_id)
  	location=Location.find_by_id(location_id)
  	unless location.nil?
  		response = Weather::Forecast.by_location(location)
  		AddForecastDataToDb.perform_at(3.days.from_now, location_id)
  	end
  end

end