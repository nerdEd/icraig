class SubLocationsController < ApplicationController
  
  def show
    @sub_location = SubLocation.find( params[:id] )
    @page_title = @sub_location.name
    @primary_location = PrimaryLocation.find( params[ :primary_location_id ] )
  end
  
end
