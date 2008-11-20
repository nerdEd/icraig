require 'test_helper'

class SubCategoryTest < ActiveSupport::TestCase
  fixtures :categories
  
  def test_create_or_retrieve
    sub_categories = Array.new
    sub_categories << SubCategory.create_or_retrieve( 'Junk', 'JunkSelling' )
    sub_categories << SubCategory.create_or_retrieve( 'Apartments', 'apartment' )
    assert_equal( sub_categories.size, 2 )
  end
  
  def test_category_anchors_from_doc
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_sub_location.html' ) { |f| Hpricot(f) }
    category_anchors = SubCategory.category_anchors_from_doc( doc, "services" )
    assert_not_nil( category_anchors )
    assert_equal( 17, category_anchors.size )
  end
  
  def test_create_from_anchor
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_sub_location.html' ) { |f| Hpricot(f) }
    anchor_elements = SubCategory.category_anchors_from_doc( doc, "services" )
    first_anchor = anchor_elements.first
    sub_category = SubCategory.create_from_anchor( first_anchor )
    assert_not_nil( sub_category )
    assert_instance_of( SubCategory, sub_category )
    assert_equal( first_anchor.attributes[ 'href' ], sub_category.code )
    assert_equal( first_anchor.inner_html, sub_category.name )
  end
end
