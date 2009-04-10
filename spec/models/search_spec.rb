require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Search do
  
  before(:each) do
    @search = Search.new
    @valid_attributes = { :primary_location => PrimaryLocation.new }
  end

  it "should be invalid without a primary location" do 
    @search.should be_invalid
  end
  
  it "should create a new instance given valid attributes" do
    Search.create!(@valid_attributes)
  end
  
end
