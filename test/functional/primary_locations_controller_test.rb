require 'test_helper'

class PrimaryLocationsControllerTest < ActionController::TestCase
  fixtures :locations 
  
  def test_index
    get :index 
    assert_response :success
  end
  
  def test_show_with_sub_locations
    get :show, :id => 1
    assert_response :success
  end
  
  def test_show_without_sub_locations
    get :show, :id => 2
    assert_response :success
  end
  
end