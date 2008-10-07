class PrimaryLocationController < ApplicationController
  
  def index
    @page_title = "Select Location"
    
    # Redirect to next step if the location is set in the session
    if( session[ :location ] != nil ) then
      redirect_to :action => "select_sub_location"
    end
    
    @locations = PrimaryLocation.find :all
  end
  
  def select    
    location = PrimaryLocation.find( params[:id] )
    session[ :location ] = location   
    redirect_to :controller => 'sub_location', :action => "index" 
  end
end
