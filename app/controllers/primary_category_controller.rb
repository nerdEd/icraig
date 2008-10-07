class PrimaryCategoryController < ApplicationController
  
  def index
    @page_title = "Select Category"
    
    if( session[ :sub_location ] == nil ) then
      @categories = session[ :location ].primary_categories
    else
      @categories = session[ :sub_location ].primary_categories
    end
  end
  
  def select
    category = PrimaryCategory.find( params[:id] )
    session[ :category ] = category
    redirect_to :controller => 'sub_category', :action => 'index'
  end
  
end