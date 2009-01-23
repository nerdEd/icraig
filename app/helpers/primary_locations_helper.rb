module PrimaryLocationsHelper
  
  def primary_location_child_url( location, child )
    if( child.instance_of? SubLocation ) then
      return primary_location_sub_location_url( location, child )
    else
      return primary_location_primary_category_url( location, child )
    end
  end
  
end
