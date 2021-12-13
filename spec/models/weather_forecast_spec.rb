require 'rails_helper'

RSpec.describe WeatherForecast, :type => :model do
  it "is valid with valid attributes" do
    location = Location.create(lattitude: 51.44, longitude: 4.56777, name: "test location")
    expect(WeatherForecast.new(date: Date.today,  min_forecasted: -10, max_forecasted: -1, location_id: location.id)).to be_valid
  end
  it "is invalid with invalid attributes" do
    expect(WeatherForecast.new).to be_invalid
  end
  it "is not valid without a date" do
    expect(WeatherForecast.new(date: nil,  min_forecasted: -10, max_forecasted: -1, location_id: Location.last)).to be_invalid
  end
  it "is not valid without a min_forecasted" do
    expect(WeatherForecast.new(date: Date.today,  min_forecasted: nil, max_forecasted: -1, location_id: Location.last)).to be_invalid
  end
  it "is not valid without a max_forecasted" do
    expect(WeatherForecast.new(date: Date.today,  min_forecasted: -10, max_forecasted: nil, location_id: Location.last)).to be_invalid
  end
end