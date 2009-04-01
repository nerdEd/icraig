require File.dirname(__FILE__) + '/../spec_helper'

describe PrimaryLocation do

  def make_location_with_no_subs
    PrimaryLocation.create( :url => "http://www.icraig.org", :name => "Frankford" ).primary_categories << PrimaryCategory.create
  end
  
  it "should find categories if it has no sub locations" do
    make_location_with_no_subs
    PrimaryLocation.find_by_id( 1 ).children.count.should > 0
  end
  
end