class PrimaryCategoryController < ApplicationController
  
  def index
    @page_title = "Select Category"
    
    if( session[ :sub_location ] == nil && session[ :location ] == nil )
      redirect_to :controller => 'primary_location', :action => 'index'
    elsif( session[ :sub_location ] == nil ) then
      @categories = session[ :location ].primary_categories( :order => 'name' )
    else
      @categories = session[ :sub_location ].primary_categories( :order => 'name' )
    end
  end
  
  def select
    if( params[ :primary_category_id ] != nil)
      category = PrimaryCategory.find( params[:primary_category_id] )
      session[ :category ] = category
      redirect_to :controller => 'sub_category', :action => 'index'
    else
      redirect_to :controller => 'primary_category', :action => 'index'
    end
  end
  
end