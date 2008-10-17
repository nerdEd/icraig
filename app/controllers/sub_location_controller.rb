class SubLocationController < ApplicationController
  
  def index
    @page_title = "Select Sub-Location"
    
    @sub_locations = session[ :location ].sub_locations
    
    # Redirect to next step if sub location is already OR if there are no sub-locations for this location
    if( @sub_locations.empty? || session[ :sub_location ] != nil ) then
      redirect_to :controller => 'primary_category', :action => 'index'
    end
  end
  
  def select
    puts params[:id]
    sub_location = SubLocation.find( params[ :id ] )
    session[ :sub_location ] = SubLocation.find( sub_location.id )
    redirect_to :controller => 'primary_category', :action => 'index'    
  end
  
end
