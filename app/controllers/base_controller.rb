class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
  end
  
  def select_location
    if( session[ :location ] != nil ) then
      redirect_to :action => "select_sub_location"
    end
    @page_title = "Select Location"
  end
  
  def select_sub_location
    @sub_locations = Location.find( location.id ).sub_locations
    if( session[ :sub_location ] != nil or @sub_locations.empty? ) then
      redirect_to :action => "select_category"
    end    
    @page_title = "Select Sub-Location"
    location = Location.find( params[:id] )
    session[ :location ] = @location
  end
  
  def select_category
    if( session[ :category ] != nil ) then
      redirect_to :action => "select_sub_location"
    end
    @page_title = "Select Category"
    sub_location = SubLocation.find( params[ :id ] )
    session[ :sub_location ] = SubLocation.find( sub_location.id )
  end
  
  def select_sub_category
    if( session[ :sub_category ] != nil ) then
      redirect_to :action => "select_sub_location"
    end
    @page_title = "Select Sub-Category"
    category = Category.find( params[:id] )
    
    @sub_categories = Category.find( category.id ).sub_categories
  end
  
  def search  
    @page_title = "Search"
    sub_category = SubCategory.find( params[ :id ] )
    
  end
  
end
