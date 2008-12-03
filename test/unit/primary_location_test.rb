require 'test_helper'
require 'rubygems'
require 'hpricot'

class PrimaryLocationTest < ActiveSupport::TestCase
  
  def test_create_from_anchor
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_home.html' ) { |f| Hpricot(f) }
    anchor_elements = PrimaryLocation.location_anchors_from_doc( doc )
    anchor_elements.each do | anchor |
      primary_location = PrimaryLocation.create_from_anchor( anchor )      
      assert_not_nil( anchor )
      assert_instance_of( PrimaryLocation, primary_location )
      assert_equal( anchor.attributes[ 'href' ], primary_location.url )
      assert_equal( anchor.inner_html.downcase, primary_location.name )
    end
    assert_equal( 112, PrimaryLocation.find( :all ).size )
  end
  
  def test_location_anchors_from_doc
    doc = open( File.dirname(__FILE__) + '/../fixtures/craigslist_home.html' ) { |f| Hpricot(f) }
    location_anchors = PrimaryLocation.location_anchors_from_doc( doc )
    assert_not_nil( location_anchors )
    assert_equal( 113, location_anchors.size )
    first_anchor_returned = location_anchors.first
    location_anchors.each do | anchor |
      assert_equal( true, anchor.attributes[ 'href' ].include?( 'http://geo.craigslist.org' ) )
    end
  end
  
end
