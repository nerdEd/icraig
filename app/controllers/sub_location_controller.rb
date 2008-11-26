class SubLocationController < ApplicationController
  
  def index
    @page_title = "Select Sub-Location"
    
    if session[ :location ] != nil
      @sub_locations = session[ :location ].sub_locations( :order => 'name' )
     
      if( @sub_locations.empty? ) then
        redirect_to :controller => 'primary_category', :action => 'index'
      end
    else
      redirect_to :controller => 'primary_location', :action => 'index'
    end
  end
  
  def select
    if params[ :sub_location_id ] != nil
      sub_location = SubLocation.find( params[ :sub_location_id ] )
      session[ :sub_location ] = SubLocation.find( sub_location.id )
      redirect_to :controller => 'primary_category', :action => 'index'    
    else
      redirect_to :action => 'index'
    end
  end
  
end
