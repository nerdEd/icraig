class SubCategoryController < ApplicationController
  
  def index
    @page_title = "Select Sub-Category"    
    if( session[ :category ] != nil )
      @sub_categories = session[ :category ].sub_categories    
    else
      redirect_to :controller => 'primary_category', :action => 'index'
    end
  end
  
  def select
    if( params[ :id ] != nil )
      sub_category = SubCategory.find( params[ :id ] )
      session[ :sub_category ] = sub_category
      redirect_to :controller => 'search', :action => 'index'
    elsif
      redirect_to :controller => 'sub_category', :action => 'index'
    end
  end
  
end
