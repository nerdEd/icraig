class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
  end
  
  def select_location
    @page_title = "Select Location"
    
    # Redirect to next step if the location is set in the session
    if( session[ :location ] != nil ) then
      redirect_to :action => "select_sub_location"
    end
    
    @locations = Location.find :all
  end
  
  def select_sub_location
    @page_title = "Select Sub-Location"    
    
    # Put location into session
    if( session[ :location ] == nil ) then
      location = Location.find( params[:id] )
      session[ :location ] = location
    end
    
    @sub_locations = session[ :location ].sub_locations
    
    # Redirect to next step if sub location is already OR if there are no sub-locations for this location
    if( session[ :sub_location ] != nil or @sub_locations.empty? ) then
      redirect_to :action => "select_category"
    end      
  end
  
  def select_category    
    @page_title = "Select Category"
    
    # Redirect to next step if the category is set in the session
    if( session[ :category ] != nil ) then
      redirect_to :action => "select_sub_category"
    end
    
    # Determine if we're coming from 'select_location' or 'select_sub_location'
    if( params[ :id ] == nil ) then
      # Populate the list of categories based on the location
      @categories = Category.find :all
    else
      sub_location = SubLocation.find( params[ :id ] )
      session[ :sub_location ] = SubLocation.find( sub_location.id )
      @categories = Category.find :all
    end    
  end
  
  def select_sub_category
    @page_title = "Select Sub-Category"
    # TODO: Redirect to search action from select_sub_category action if there are no sub-categories
    if( session[ :sub_category ] != nil ) then
      redirect_to :action => "search"
    end
    category = Category.find( params[:id] )
    @sub_categories = Category.find( category.id ).sub_categories
  end
  
  # TODO: Rename search action to build_search
  def search  
    @page_title = "Search"
    session[ :sub_category ] = session [ :sub_category ] || SubCategory.find( params[ :id ] )
  end
  
end
