class PrimaryLocationsController < ApplicationController
  
  def index
    @page_title = "Select Location"    
    @locations = PrimaryLocation.find( :all, :select => 'id, name', :order => 'name' )
  end
  
  def show    
    @location = PrimaryLocation.find( params[:id], :select => 'id, name' )
    @page_title = @location.name
    @sub_locations = SubLocation.find_all_by_primary_location_id( @location.id, :select => 'id, name' )
    if( @sub_locations.empty? ) then      
      @primary_categories = @location.primary_categories
    end
  end
end