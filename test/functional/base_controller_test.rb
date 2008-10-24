require 'test_helper'

class BaseControllerTest < ActionController::TestCase
  
  def setup 
    @controller = BaseController.new 
    @request = ActionController::TestRequest.new 
    @response = ActionController::TestResponse.new 
  end 
  
  def test_index
    get :index 
    assert_response :success     
  end
end
