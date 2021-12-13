module Weather
  class Forecast
  	# method to call external api
    def self.by_location(location)
      response = Faraday.get "https://www.7timer.info/bin/astro.php?lon=" + location.longitude.to_s + "&lat=" + location.lattitude.to_s + "&ac=0&unit=metric&output=json&tzshift=0"
      self.parse_response(response.body, location)
    end

    # method to parse the response from the api and save it in the database
    def self.parse_response(response, location)
    	response=JSON.parse(response)
    	date = response["init"].to_s.to_date
    	dataseries = response["dataseries"]
    	temp = []
    	for data in dataseries do
    		temperature = data["temp2m"]
    		temp.append(temperature)
    	end
    	temp = temp.each_slice(8).to_a #24 hours divided by 3 hour interval = 8 intervals
    	for t in temp
    		max = t.max
    		min = t.min
    		if WeatherForecast.where(date: date.all_day, location_id: location.id).empty?
    			WeatherForecast.create!(date: date, min_forecasted: min, max_forecasted: max, location_id: location.id)
    		end
    		date = date + 1.day
    	end
    end
  end
end