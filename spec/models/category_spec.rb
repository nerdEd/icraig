require File.dirname(__FILE__) + '/../spec_helper'

describe Category do
  
  before( :each ) do
    @category = Category.new
  end
  
  it "should be invalid without a name" do
    @category.should_not be_valid
  end
  
  it "should be invalid without a unique name" do
    Category.create( :name => "Apartments", :code => "code" )
    @category.name = "Apartments"
    @category.should_not be_valid
  end
  
  it "should be invalid without a code" do 
    @category.should_not be_valid
  end
  
  it "should be invalid without a unique code" do
    Category.create( :name => "Apartments", :code => "code" )
    @category.code = "code"
    @category.should_not be_valid
  end
end