class Location < ActiveRecord::Base   
	validates :lattitude, presence: true
	validates :longitude, presence: true 
	validates :name, presence: true, uniqueness: true
	validates :slug, uniqueness: true
	after_create :update_slug, :save_forecast
	before_update :assign_slug
	has_many :weather_forecasts, dependent: :destroy

	def create_slug
	  self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
	end

	def update_slug
	  update slug: assign_slug
	end

	def save_forecast
		AddForecastDataToDb.perform_async(self.id)
	end

	private

	def assign_slug
	  self.slug = create_slug
	end

end   
