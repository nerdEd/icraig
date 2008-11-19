require 'test_helper'

class PrimaryCategoryTest < ActiveSupport::TestCase
  fixtures :categories
  
  def test_create_or_retrieve
    primary_categories = Array.new
    primary_categories << PrimaryCategory.create_or_retrieve( 'Junk', 'JunkSelling' )
    primary_categories << PrimaryCategory.create_or_retrieve( 'Housing', 'house' )
    assert_equal( primary_categories.size, 2 )
  end
  
  def test_category_anchors_from_doc
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_sub_location.html' ) { |f| Hpricot(f) }
    location_anchors = PrimaryCategory.category_anchors_from_doc( doc )
    assert_not_nil( location_anchors )
    assert_equal( 7, location_anchors.size )
  end
  
  def test_create_from_anchor
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_sub_location.html' ) { |f| Hpricot(f) }
    anchor_elements = PrimaryCategory.category_anchors_from_doc( doc )
    first_anchor = anchor_elements.first
    primary_category = PrimaryCategory.create_from_anchor( first_anchor )
    assert_not_nil( primary_category )
    assert_instance_of( PrimaryCategory, primary_category )
    assert_equal( first_anchor.attributes[ 'href' ], primary_category.code )
    assert_equal( first_anchor.inner_html, primary_category.name )
  end
  
end
