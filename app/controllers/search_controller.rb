class SearchController < ApplicationController
  
  def search
    primary_location = PrimaryLocation.find( params[ :primary_location_id ] )
    if( params[ :sub_location_id ] != nil ) then
      sub_location = SubLocation.find( params[ :sub_location_id ] )
    end        
    primary_category_id = params[ :primary_category_id ] || params[ :id ]
    primary_category = PrimaryCategory.find( primary_category_id )
    if( params[ :primary_category_id ] != nil ) then
      sub_category = SubCategory.find( params[ :id ] )
    end

    location = sub_location || primary_location
    category = sub_category || primary_category
    url = "#{location.url}search/#{category.code}"
    
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
  
end