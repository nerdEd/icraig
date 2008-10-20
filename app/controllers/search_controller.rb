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
    url = url + 'search/'
    url = url + sub_category.code
    search_terms = params[ :search ][ :terms ]
    search_titles = params[ :search ][ :only_search_titles ]
    has_image = params[ :search ][ :has_image ]
    query = { :query => search_terms }
    if( search_titles ) then
      query[ :srchType ] = 'T'
    end
    if( has_image ) then
      query[ :hasPic ] = 1
    end
    url = url + "?" + query.to_query
    redirect_to url    
  end
end
