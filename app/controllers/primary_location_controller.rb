class PrimaryLocationController < ApplicationController
  
  def index
    @page_title = "Select Location"
    
    @locations = PrimaryLocation.find :all
  end
  
  def select    
    location = PrimaryLocation.find( params[:id] )
    session[ :location ] = location   
    redirect_to :controller => 'sub_location', :action => 'index' 
  end
end
