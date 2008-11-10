require 'test_helper'

class SubCategoryTest < ActiveSupport::TestCase
  fixtures :categories
  
  def test_create_or_retrieve
    sub_categories = Array.new
    sub_categories << SubCategory.create_or_retrieve( 'Junk', 'JunkSelling' )
    sub_categories << SubCategory.create_or_retrieve( 'Apartments', 'apartment' )
    assert_equal( sub_categories.size, 2 )
  end
end
