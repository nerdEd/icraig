require 'test_helper'

class SubCategoryControllerTest < ActionController::TestCase
  fixtures :categories
  
  def test_index
  end
    
  def test_index_without_category_set
    get :index 
    assert_redirected_to :controller => 'primary_category', :action => 'index'
  end
  
  def test_select_with_sub_category
    get :select, :id =>  categories( :NormalSubCategory ).id
    assert_redirected_to :controller => 'search', :action => 'index'
  end
  
  def test_select_without_sub_category
    get :select
    assert_redirected_to :controller => 'sub_category', :action => 'index'
  end
end
