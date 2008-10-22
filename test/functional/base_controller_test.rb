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
  
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
