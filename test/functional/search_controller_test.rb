require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  fixtures :locations, :categories
  
  def setup
    @location = locations( :NormalPrimaryLocation )
    @sub_location = locations( :NormalSubLocation )
    @category = categories( :NormalPrimaryCategory )
    @sub_category = categories( :NormalSubCategory )
  end
  
  def test_index    
    get :index, {}, { :location => @location, :sub_location => @sub_location, :category => @category, :sub_category => @sub_category }
    assert_not_nil( assigns( :trail ) )
    assert_equal( "#{@location.name} --> #{@sub_location.name} --> #{@category.name} --> #{@sub_category.name}", assigns( :trail ) )
    
    get :index, {}, { :location => @location, :category => @category, :sub_category => @sub_category }
    assert_not_nil( assigns( :trail ) )
    assert_equal( "#{@location.name} --> #{@category.name} --> #{@sub_category.name}", assigns( :trail ) )
    
    get :index, {}, { :location => @location, :category => @category }
    assert_not_nil( assigns( :trail ) )
    assert_equal( "#{@location.name} --> #{@category.name}", assigns( :trail ) )
  end
  
  def test_search
    post :search, { :search => { :terms => 'cat' } }, { :location => @location, :sub_location => @sub_location, :category => @category, :sub_category => @sub_category }
    assert_redirected_to "http://auburn.craigslist.org/search/apartment?query=cat"
    
    post :search, { :search => { :terms => 'cat' } }, { :location => @location, :category => @category, :sub_category => @sub_category }
    assert_redirected_to "http://geo.craigslist.org/iso/us/alsearch/apartment?query=cat"
        
    post :search, { :search => { :terms => 'cat' } }, { :location => @location, :category => @category }    
    assert_redirected_to "http://geo.craigslist.org/iso/us/alsearch/?query=cat"
    
    #TODO: test title search posibilities
    #TODO: test has image posibilities
    #TODO: expand test_search to include more form/session combinations
  end
  
end