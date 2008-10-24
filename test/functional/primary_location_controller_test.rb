require 'test_helper'

class PrimaryLocationControllerTest < ActionController::TestCase
  fixtures :locations
  
  def setup 
    @controller = PrimaryLocationController.new 
    @request = ActionController::TestRequest.new 
    @response = ActionController::TestResponse.new 
  end
  
  def test_index
    get :index 
    assert_response :success
  end
  
  def test_select
    get :select 
    assert_response :success
  end
end
