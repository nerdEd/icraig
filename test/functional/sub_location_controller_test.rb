require 'test_helper'

class SubLocationControllerTest < ActionController::TestCase
  fixtures :locations
  
  def test_index_without_location_set
    get :index 
    assert_redirected_to :controller => 'primary_location', :action => 'index'
  end
  
  def test_index
    get :index, {}, { :location => locations( :NormalPrimaryLocation ) }
    assert_response :success
  end
  
  def test_select_with_sub_location
    get :select, :sub_location_id =>  locations( :NormalSubLocation ).id
    assert_redirected_to :controller => 'primary_category', :action => 'index'
  end
  
  def test_select_without_sub_location
    get :select
    assert_redirected_to :controller => 'sub_location', :action => 'index'
  end
end
