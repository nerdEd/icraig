class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
  end
  
  def select_location
    @page_title = "Select Location"
  end
  
  def select_sub_location
    @page_title = "Select Sub-Location"
    @location = Location.find( params[:id] )
    session[ :location ] = @location
    @sub_locations = Location.find( @location.id ).sub_locations
  end
  
  def select_category
    @page_title = "Select Category"
    session[ :sub_location ] = SubLocation.find( params[:id] )
  end
  
  def select_sub_category
    @page_title = "Select Sub-Category"
    @category = Category.find( params[:id] )
    @sub_categories = Category.find( @category.id ).sub_categories
  end
  
  def search  
  end
  
end
