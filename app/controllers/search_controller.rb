class SearchController < ApplicationController

  def index
    @page_title='Enter Search'
    @trail = generate_trail
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
    if( sub_category != nil )
      url = url + sub_category.code
    end
    search_terms = params[ :search ][ :terms ]
    search_titles = params[ :search ][ :only_search_titles ]
    has_image = params[ :search ][ :has_image ]
    query = { :query => search_terms }
    if( search_titles == '1' ) then
      query[ :srchType ] = 'T'
    end
    if( has_image == '1' ) then
      query[ :hasPic ] = 1
    end
    url = url + "?" + query.to_query
    redirect_to url    
  end
  
  private
    
    def generate_trail
      trail = session[ :location ].name + " --> "
      if( session[ :sub_location ] != nil ) then
        trail += session[ :sub_location ].name + " --> "
      end
      trail += session[ :category ].name
      if( session[ :sub_category ] != nil ) then
        trail += " --> " + session[ :sub_category ].name
      end   
      return trail   
    end
end