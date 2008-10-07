class SubCategoryController < ApplicationController
  
  def index
    @page_title = "Select Sub-Category"    
    @sub_categories = session[ :category ].sub_categories    
  end
  
  def select
    sub_category = SubCategory.find( params[ :id ] )
    session[ :sub_category ] = sub_category
    redirect_to :controller => 'search', :action => 'index'
  end
  
end
