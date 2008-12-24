class PrimaryCategoriesController < SearchController  
  
  def show
    @primary_category = PrimaryCategory.find( params[ :id ] )
    @page_title = @primary_category.name
    if( params[ :sub_location_id ] != nil )
      @sub_location = SubLocation.find( params[ :sub_location_id ] )
    else
      @sub_location = nil
    end
    @primary_location = PrimaryLocation.find( params[ :primary_location_id ] )
  end

end