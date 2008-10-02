require 'rubygems'
require 'hpricot'
require 'open-uri'

namespace :icraig do
  
  desc 'scrape all Locations and Sub-Locations from Craigslist, and load them into the database'
  task :scrape_locations => :environment do
    location_doc = Hpricot( open( "http://www.craigslist.org" ) )
    ( location_doc/"a" ).each do | anchor |
      href = anchor.attributes[ 'href' ]
      anchor_contents = anchor.inner_html
      if( href.include?( 'http://geo.craigslist.org' ) and !anchor_contents.include?( 'more' ) ) then      
        location = PrimaryLocation.create( :name => anchor_contents, :url => href )
        puts location
        sub_loc_doc = Hpricot( open( href ) )
        ( sub_loc_doc/"#list/a" ).each do | sub_anchor |          
          name = sub_anchor.inner_html.sub( /(<b>)/i, '' ).sub( /(<\/b>)/i, '' )
          sub_location = location.sub_locations.create( :name => name, :url => sub_anchor.attributes[ 'href' ] )
          puts sub_location
        end
      end
    end
  end

  desc 'scrape all Categories and Sub-Categories from Craigslist'
  task :scrape_categories => :environment do 
    
    # Load all categories/sub-categories for sub-locations
    sub_locations = SubLocation.find :all    
    sub_locations.each do | sub_location |
      doc = Hpricot( open( sub_location.url ) )  
      ( doc/"div.ban/a" ).each do | category_anchor |
        name = category_anchor.inner_html
        code = category_anchor.attributes[ 'href' ]
        if( PrimaryCategory.find( :all, [ "code = ?", code ] ).empty? ) then
          category = PrimaryCategory.new( :name => name, :code => code )
          category.save
          sub_location.primary_categories << category
          puts name
        end
      end
    end
    
    # TODO: Load all categories for locations (without sub-locations)
    # TODO: Load all sub-categories for categories    
  end
  
end