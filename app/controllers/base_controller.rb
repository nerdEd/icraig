class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
    
    # TODO: remove temp session clearing code.
    session[ :location ] = nil
    session[ :sub_location ] = nil
    session[ :category ] = nil
  end
  
  def select_location
    @page_title = "Select Location"
    
    # Redirect to next step if the location is set in the session
    if( session[ :location ] != nil ) then
      redirect_to :action => "select_sub_location"
    end
    
    @locations = PrimaryLocation.find :all
  end
  
  def select_sub_location
    @page_title = "Select Sub-Location"
    
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
      @categories = session[ :location ].primary_categories
    else
      sub_location = SubLocation.find( params[ :id ] )
      session[ :sub_location ] = SubLocation.find( sub_location.id )
      @categories = sub_location.primary_categories
    end    
  end
  
  def select_sub_category
    @page_title = "Select Sub-Category"
    
    # TODO: Redirect to search action from select_sub_category action if there are no sub-categories
    if( session[ :sub_category ] != nil ) then
      redirect_to :action => "search"
    end
    category = PrimaryCategory.find( params[:id] )
    @sub_categories = PrimaryCategory.find( category.id ).sub_categories
  end
  
  # TODO: Rename search action to build_search
  def search  
    @page_title = "Search"
    session[ :sub_category ] = session [ :sub_category ] || SubCategory.find( params[ :id ] )
  end
  
end
