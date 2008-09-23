require 'rubygems'
require 'hpricot'
require 'open-uri'

namespace :icraig do
  
  desc 'scrape all Locations and Sub-Locations from Craigslist'
  task :scrape_locations => :environment do
    location_doc = Hpricot( open( "http://www.craigslist.org" ) )
    ( location_doc/"a" ).each do | anchor |
      href = anchor.attributes[ 'href' ]
      anchor_contents = anchor.inner_html
      if( href.include?( 'http://geo.craigslist.org' ) and !anchor_contents.include?( 'more' ) ) then      
        location = Location.create( :name => anchor_contents )
        location.save
        sub_loc_doc = Hpricot( open( href ) )
        ( sub_loc_doc/"#list/a" ).each do | sub_anchor |
          name = sub_anchor.inner_html.sub( /(<b>)/i, '' ).sub( /(<\/b>)/i, '' )
          location.sub_locations.create( :name => name, :url => sub_anchor.attributes[ 'href' ] )
        end
      end
    end
  end

  desc 'scrape all Categories and Sub-Categories from Craigslist'
  task :scrape_categories => :environment do 
    # TODO: implementation
    # NOTE: Categories/Sub-Categories vary based on location...
    #       This should be taken into consideration when implemented.
    sub_locations = SubLocation.find :all
    sub_locations.each do | location |
      doc = Hpricot( open( location.url ) )
      
    end
  end
  
end