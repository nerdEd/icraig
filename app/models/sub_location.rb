class SubLocation < Location
  belongs_to :primary_location
  belongs_to :search
  
  def SubLocation.create_from_anchor( anchor_element )
    name = anchor_element.inner_html.gsub( /<b>|<\/b>/i, '' )
    url = anchor_element.attributes[ 'href' ]
    return SubLocation.create( :name => name, :url => url )
  end
  
  def SubLocation.location_anchors_from_doc( doc )
    return ( doc/"#list/a" )
  end
  
end
