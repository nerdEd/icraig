class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
  end
  
  def select_location
    if( session[ :location ] != nil ) then
      redirect_to :action => "select_sub_location"
    end
    @page_title = "Select Location"
    @locations = Location.find :all
  end
  
  def select_sub_location
    location = Location.find( params[:id] )
    @sub_locations = Location.find( location.id ).sub_locations
    if( session[ :sub_location ] != nil or @sub_locations.empty? ) then
      redirect_to :action => "select_category"
    end    
    @page_title = "Select Sub-Location"
    session[ :location ] = @location
  end
  
  def select_category
    if( session[ :category ] != nil ) then
      redirect_to :action => "select_sub_category"
    end
    @page_title = "Select Category"
    sub_location = SubLocation.find( params[ :id ] )
    session[ :sub_location ] = SubLocation.find( sub_location.id )
    # TODO: Categories retrieved in select_category action should be location specific
    @categories = Category.find :all
  end
  
  def select_sub_category
    # TODO: Redirect to search action from select_sub_category action if there are no sub-categories
    if( session[ :sub_category ] != nil ) then
      redirect_to :action => "search"
    end
    @page_title = "Select Sub-Category"
    category = Category.find( params[:id] )
    @sub_categories = Category.find( category.id ).sub_categories
  end
  
  # TODO: Rename search action to build_search
  def search  
    @page_title = "Search"
    session[ :sub_category ] = session [ :sub_category ] || SubCategory.find( params[ :id ] )
  end
  
end
