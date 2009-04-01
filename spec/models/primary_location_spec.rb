require File.dirname(__FILE__) + '/../spec_helper'

describe PrimaryLocation do
  
  before( :each ) do
    @primary_location = PrimaryLocation.new
  end
  
  it "should find categories as children if it has no sub locations" do
    @primary_location.primary_categories << PrimaryCategory.new
    @primary_location.children.should_not be_empty 
    @primary_location.children.first.should be_a( PrimaryCategory )
  end
  
  it "should find sub locations for children if it has sub locations" do
    @primary_location.sub_locations << SubLocation.new
    @primary_location.children.should_not be_empty
    @primary_location.children.first.should be_a( SubLocation )
  end
  
end