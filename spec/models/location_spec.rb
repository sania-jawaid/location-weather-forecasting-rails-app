require 'rails_helper'

RSpec.describe Location, :type => :model do
  it "is valid with valid attributes" do
    expect(Location.new(lattitude: 51.44, longitude: 4.56777, name: "test location")).to be_valid
  end
  it "is invalid with invalid attributes" do
    expect(Location.new).to be_invalid
  end
  it "is not valid without a lattitude" do
    expect(Location.new(lattitude: nil, longitude: 4.56777, name: "test location")).to be_invalid
  end
  it "is not valid without a longitude" do
    expect(Location.new(lattitude: 51.44, longitude: nil, name: "test location")).to be_invalid
  end
  it "is not valid without a name" do
    expect(Location.new(lattitude: 51.44, longitude: 4.56777, name: nil)).to be_invalid
  end
  it "is not valid without a slug" do
    expect(Location.create(lattitude: 51.44, longitude: 4.56777, name: "test location").slug).to eq("test-location")
  end
end