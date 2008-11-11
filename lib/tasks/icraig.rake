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
        puts location.name
        sub_loc_doc = Hpricot( open( href ) )
        ( sub_loc_doc/"#list/a" ).each do | sub_anchor |          
          location.is_childless = false
          location.save
          name = sub_anchor.inner_html.sub( /(<b>)/i, '' ).sub( /(<\/b>)/i, '' )
          sub_location = location.sub_locations.create( :name => name, :url => sub_anchor.attributes[ 'href' ] )
          puts " -- " + sub_location.name
        end
      end
    end
  end

  desc 'scrape all Categories and Sub-Categories from Craigslist, and load them into the database'
  task :scrape_categories => :environment do 
    
    locations = Location.find( :all, :conditions => "is_childless = 't'" )
    locations.each do | location |          
      puts 'Currently Scraping: ' + location.name      
      doc = Hpricot( open( location.url ) )
      ( doc/"table[@summary='main'] div.ban a[@href != '/forums/']" ).each do | category_anchor |
        category = PrimaryCategory.create_or_retrieve( category_anchor.inner_html, category_anchor.attributes[ 'href' ] )     
        location.primary_categories << category
        puts category
        
        # Process sub-categories
        ( doc/"table.w2[@summary='#{category.name}'] a").each do | sub_cat_anchor |
          sub_category = SubCategory.create_or_retrieve( sub_cat_anchor.inner_html, sub_cat_anchor.attributes[ 'href' ] )
          category.sub_categories << sub_category
          puts " -- " + sub_category
        end        
      end      
    end    
  end
  
end