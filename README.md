# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.0.3, Rails version 6.1.4.1

* System dependencies mentioned in Gemfile

* Deployment instructions

* ...

# For Development environment:

## For rails server
	** Run bundle install
	** rake db:migrate
	** rails server
	** Run application on http://localhost:3000/

## For sidekiq
	** bundle exec sidekiq


# For Test environment:
	** rails generate rspec:install
	** rake db:migrate db:test:prepare
	** rspec .\spec


#URLS
http://localhost:3000/
http://localhost:3000/locations
http://localhost:3000/locations/new
http://localhost:3000/locations/new-jersey
http://localhost:3000/locations/new-jersey/edit 
http://localhost:3000/locations/new-jersey/forecast
http://localhost:3000/weather_forecasts?end_date=2021-12-15&location_slug=new-jersey&start_date=2021-12-14