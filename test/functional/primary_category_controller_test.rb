require 'test_helper'

class PrimaryCategoryControllerTest < ActionController::TestCase
  fixtures :categories
  
  def test_index
  end
    
  def test_index_without_location_set
    get :index 
    assert_redirected_to :controller => 'primary_location', :action => 'index'
  end
  
  def test_select_with_category
    get :select, :primary_category_id =>  categories( :NormalPrimaryCategory ).id
    assert_redirected_to :controller => 'sub_category', :action => 'index'
  end
  
  def test_select_without_category
    get :select
    assert_redirected_to :controller => 'primary_category', :action => 'index'
  end
end
