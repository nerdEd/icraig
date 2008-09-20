class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
  end
  
  def select_location
    @page_title = "Select Location"
  end
  
  def select_sub_location
    @page_title = "Select Sub-Location"
    @location_id = params[:id]
    @sub_locations = Location.find( @location_id ).sub_locations
  end
  
  def select_category
    @page_title = "Select Category"
    @sub_location_id = params[:id]
  end
  
  def select_sub_category
    @page_title = "Select Sub-Category"
    @category_id = params[:id]
    @sub_categories = Category.find( @category_id ).sub_categories
  end
  
  def search  
  end
  
end
