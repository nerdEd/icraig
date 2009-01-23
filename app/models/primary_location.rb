require 'rubygems'
require 'hpricot'

class PrimaryLocation < Location
  has_many :sub_locations
  

  
  def PrimaryLocation.create_from_anchor( anchor_element )
    return PrimaryLocation.create( :name => anchor_element.inner_html.downcase, :url => anchor_element.attributes[ 'href' ] )
  end
  
  def PrimaryLocation.location_anchors_from_doc( doc )
    location_anchors = Array.new
    doc.search( 'a[ @href*="http://geo.craigslist.org" ]' ) do | anchor |
      if( !anchor.inner_html.include?( 'more' ) )
        location_anchors << anchor
      end
    end
    return location_anchors
  end  
  
  def children
    children = SubLocation.find_all_by_primary_location_id( id, :select => 'id, name' )
    if( children.empty? ) then
      children = self.primary_categories
    end
    return children
  end
  
end