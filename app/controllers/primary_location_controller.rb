class PrimaryLocationController < ApplicationController
  
  def index
    @page_title = "Select Location"
    
    @locations = PrimaryLocation.find( :all, :order => 'name' )
  end
  
  def select    
    if params[ :location_id ] != nil
      location = PrimaryLocation.find( params[:location_id] )
      session[ :location ] = location   
      redirect_to :controller => 'sub_location', :action => 'index' 
    else
      redirect_to :action => 'index'
    end
  end
end
