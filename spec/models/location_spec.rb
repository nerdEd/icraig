require File.dirname(__FILE__) + '/../spec_helper'

describe Location do
  
  setup do

  end

  it "should be invalid without a unique name" do
    location_one = Location.new
    location_one.name = "Frankford"
    location_one.save
    
    location_two = Location.new
    location_two.name = "Frankford"
    
    location_two.should_not be_valid
  end
  
  it "should be invalid without a unique url" do
    location_one = Location.new
    location_one.url = "http://www.icraig.org"
    location_one.save
    
    location_two = Location.new
    location_two.url = "http://www.icraig.org"
    
    location_two.should_not be_valid
  end
  
  it "should be invalid without an url" do
    location_one = Location.new
    location_one.should_not be_valid
  end
  
  it "shoudl be invalid without a name" do
    location_one = Location.new
    location_one.should_not be_valid
  end
  
end