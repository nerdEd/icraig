module PrimaryCategoriesHelper
  def primary_category_breadcrumb
    trail = PrimaryLocation.find( params[ :primary_location_id ] ).name  + " --> "
    if( params[ :sub_location_id ] != nil ) then
      trail += SubLocation.find( params[ :sub_location_id ] ).name + " --> "
    end
    trail += PrimaryCategory.find( params[ :id ] ).name
    return trail   
  end
end
