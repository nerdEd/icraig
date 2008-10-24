require 'test_helper'

class PrimaryLocationControllerTest < ActionController::TestCase
  fixtures :locations 
  
  def test_index
    get :index 
    assert_response :success
  end
  
  def test_select_with_location
    get :select, :location_id =>  locations( :NormalPrimaryLocation ).id
    assert_redirected_to :controller => 'sub_location', :action => 'index'
  end
  
  def test_select_without_location
    get :select
    assert_redirected_to :controller => 'primary_location', :action => 'index'
  end
end