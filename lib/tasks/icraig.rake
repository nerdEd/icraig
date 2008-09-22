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
        location = Location.new( anchor_contents, '' )
        location.save
        puts location
        sub_loc_doc = Hpricot( open( href ) )
        ( sub_loc_doc/"#list/a" ).each do | sub_anchor |
          # TODO: add code to strip out '<b>' and '</b>' from inner html
          sub_loc = SubLocation.new( sub_anchor.inner_html, '', location.id )
          sub_loc.url = sub_anchor.attributes[ 'href' ]
          sub_loc.save   
          puts sub_loc
        end
      end
    end
  end

  desc 'scrape all Categories and Sub-Categories from Craigslist'
  task :scrape_categories => :environment do 
    # TODO: implementation
    # NOTE: Categories/Sub-Categories vary based on location...
    #       This should be taken into consideration when implemented.
  end
  
end