require 'test_helper'

class PrimaryCategoriesControllerTest < ActionController::TestCase
  fixtures :categories
  
  def test_show
    get :show, { :primary_location_id => 1, :sub_location_id => 4, :id => 1}
    assert_response :success
  end
  
  def test_show_without_sub_location
    get :show, { :primary_location_id => 2, :id => 1}
    assert_response :success
  end
  
end