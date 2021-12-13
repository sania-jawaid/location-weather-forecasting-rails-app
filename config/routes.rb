Rails.application.routes.draw do
	require 'sidekiq/web'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # get "/locations", to: "locations#index"

	# resources :locations do
	get '/weather_forecasts', to: "weather_forecasts#index"
	# resources :locations, param: :slug 
	resources :locations, param: :slug do
		get :forecast
		get :fetch_forecast
	end
	root 'locations#index'  
	mount Sidekiq::Web => "/admin/sidekiq"
	# get '/sidekiq'
end
