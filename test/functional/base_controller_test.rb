require 'test_helper'

class BaseControllerTest < ActionController::TestCase
  
  def test_index
    get :index 
    assert_response :success     
  end
  
end
