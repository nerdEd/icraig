require 'test_helper'

class PrimaryCategoryTest < ActiveSupport::TestCase
  
  def test_create_or_retrieve
    # A Primary Category 'Housing' 'house' has already been created by fixtures
    PrimaryCategory.create_or_retrieve( 'Housing', 'house' )
    assert_equal( 1, PrimaryCategory.find( :all ).size )
  end
  
  def test_category_anchors_from_doc
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_sub_location.html' ) { |f| Hpricot(f) }
    location_anchors = PrimaryCategory.category_anchors_from_doc( doc )
    assert_not_nil( location_anchors )
    assert_equal( 7, location_anchors.size )
  end
  
  def test_create_from_anchor
    number_of_categories_from_fixture = PrimaryCategory.find( :all ).size
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_sub_location.html' ) { |f| Hpricot(f) }
    anchor_elements = PrimaryCategory.category_anchors_from_doc( doc )
    first_anchor = anchor_elements.first    
    anchor_elements.each do | anchor |
      primary_category = PrimaryCategory.create_from_anchor( anchor )
      assert_not_nil( primary_category )
      assert_instance_of( PrimaryCategory, primary_category )
      assert_equal( anchor.attributes[ 'href' ], primary_category.code )
      assert_equal( anchor.inner_html, primary_category.name )
    end
    
    assert_equal( 7 + number_of_categories_from_fixture , PrimaryCategory.find( :all ).size )
  end
  
end
