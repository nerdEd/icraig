class SearchController < ApplicationController

  def index
  end
  
  def search
    primary_location = session[ :location ]
    sub_location = session[ :sub_location ]
    primary_category = session[ :category ]
    sub_category = session[ :sub_category ]
    if( sub_location == nil ) then
      url = primary_location.url
    else 
      url = sub_location.url
    end
    url = url + sub_category.code
    search_terms = params[ :search ][ :terms ]
    query = { :query => search_terms }
    url = url + "?" + query.to_query
    redirect_to url    
  end
end
