require 'rubygems'
require 'hpricot'

class PrimaryLocation < Location
  has_many :sub_locations
  
  def self.create_from_anchor( anchor_element )
    return PrimaryLocation.create( :name => anchor_element.inner_html, :url => anchor_element.attributes[ 'href' ] )
  end
  
  def self.location_anchors_from_doc( doc )
    location_anchors = Array.new
    ( doc/"a" ).each do | anchor |
      href = anchor.attributes[ 'href' ]
      anchor_contents = anchor.inner_html
      if( href.include?( 'http://geo.craigslist.org' ) and !anchor_contents.include?( 'more' ) ) then      
        location_anchors << anchor
      end
    end
    return location_anchors
  end
  
end
