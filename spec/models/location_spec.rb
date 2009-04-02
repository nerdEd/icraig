require File.dirname(__FILE__) + '/../spec_helper'

describe Location do
  
  before( :each ) do
    @location = Location.new
  end

  it "should be invalid without a unique name" do
    Location.create( :name => "Germany", :url => "www.icraig.org" )
    @location.name = "Germany"
    @location.should_not be_valid
  end
  
  it "should be invalid without a unique url" do
    Location.create( :name => "Germany", :url => "www.icraig.org" )
    @location.url = "www.icraig.org"
    @location.should_not be_valid
  end
  
  it "should be invalid without an url" do
    @location.should_not be_valid
  end
  
  it "shoudl be invalid without a name" do
    @location.should_not be_valid
  end
  
end