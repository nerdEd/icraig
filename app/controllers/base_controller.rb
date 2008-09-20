class BaseController < ApplicationController
  
  def index
  end
  
  def select_sub_location
    @location_id = params[:id]
    @sub_locations = Location.find( @location_id ).sub_locations
  end
  
  def select_category
    @sub_location_id = params[:id]
  end
  
  def select_sub_category
    @category_id = params[:id]
    @sub_categories = Category.find( @category_id ).sub_categories
  end
  
  def search  
  end
  
end
