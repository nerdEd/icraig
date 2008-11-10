require 'test_helper'

class PrimaryCategoryTest < ActiveSupport::TestCase
  fixtures :categories
  
  def test_create_or_retrieve
    primary_categories = Array.new
    primary_categories << PrimaryCategory.create_or_retrieve( 'Junk', 'JunkSelling' )
    primary_categories << PrimaryCategory.create_or_retrieve( 'Housing', 'house' )
    assert_equal( primary_categories.size, 2 )
  end
  
end
