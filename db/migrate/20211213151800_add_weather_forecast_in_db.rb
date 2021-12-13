class AddWeatherForecastInDb < ActiveRecord::Migration[6.1]
  def change
  	create_table :weather_forecasts do |t|
      t.datetime :date, null: false
      t.float :min_forecasted, null: false
      t.float :max_forecasted, null: false
  	  t.belongs_to :location
      t.timestamps
    end
  end
end
