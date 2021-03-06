# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Generates a breadcrumb trail of the users selections. 
  # Note: this is currently only suitable for use at the primary category or sub category level
  def breadcrumbs
    trail = PrimaryLocation.find( params[ :primary_location_id ] ).name  + " --> "
    if( params[ :sub_location_id ] != nil ) then
      trail += SubLocation.find( params[ :sub_location_id ] ).name + " --> "
    end
    primary_category_id = params[ :primary_category_id ] || params[ :id ]
    trail += PrimaryCategory.find( primary_category_id ).name
    if( params[ :primary_category_id ] != nil ) then
      trail += " --> " + SubCategory.find( params[ :id ] ).name
    end
    return trail   
  end
end