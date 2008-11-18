require 'test_helper'

class SubLocationTest < ActiveSupport::TestCase
  
  def test_create_from_anchor
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_primary_location.html' ) { |f| Hpricot(f) }
    anchor_elements = SubLocation.location_anchors_from_doc( doc )
    first_anchor = anchor_elements.first
    sub_location = SubLocation.create_from_anchor( first_anchor )
    assert_not_nil( sub_location )
    assert_instance_of( SubLocation, sub_location )
    assert_equal( first_anchor.attributes[ 'href' ], sub_location.url )
    assert_equal( first_anchor.inner_html, sub_location.name )
  end
  
  def test_location_anchors_from_doc( doc )
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_primary_location.html' ) { |f| Hpricot(f) }
    location_anchors = SubLocation.location_anchors_from_doc( doc )
    assert_not_nil( location_anchors )
    assert_equal( 10, location_anchors.size )
    first_anchor_returned = location_anchors.first
    location_anchors.each do | anchor |
      assert_equal( true, anchor.attributes[ 'href' ].include?( 'http://geo.craigslist.org' ) )
    end
  end
  
end
