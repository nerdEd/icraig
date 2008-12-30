class PrimaryLocationsController < ApplicationController
  
  def index
    @page_title = "Select Location"    
    @locations = PrimaryLocation.find( :all, :order => 'name' )
  end
  
  def show    
    @location = PrimaryLocation.find( params[:id] )
    @page_title = @location.name
  end
end