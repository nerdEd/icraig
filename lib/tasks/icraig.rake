require 'rubygems'
require 'hpricot'
require 'open-uri'

namespace :icraig do
  
  desc 'scrape all Locations and Sub-Locations from Craigslist, and load them into the database'
  task :scrape_locations => :environment do
    location_doc = Hpricot( open( "http://www.craigslist.org" ) )
    # retrieve list of all location anchors.
    PrimaryLocation.location_anchors_from_doc( location_doc ).each do | anchor |
      location = PrimaryLocation.create_from_anchor( anchor )
      puts location.name
      SubLocation.location_anchors_from_doc( Hpricot( open( location.url ) ) ).each do | sub_anchor |
        location.is_childless = false
        sub_location = SubLocation.create_from_anchor( sub_anchor )
        location.sub_locations << sub_location
        puts " -- " + sub_location.name
      end
    end
  end

  desc 'scrape all Categories and Sub-Categories from Craigslist, and load them into the database'
  task :scrape_categories => :environment do     
    locations = Location.find( :all, :conditions => "is_childless = 't'" )
    locations.each do | location |          
      puts 'Currently Scraping: ' + location.name      
      doc = Hpricot( open( location.url ) )
      # retrieve list of all category anchors
      PrimaryCategory.category_anchors_from_doc( doc ).each do | category_anchor |
        category = PrimaryCategory.create_from_anchor( category_anchor )
        location.primary_categories << category
        puts category.name
        ( doc/"table.w2[@summary='#{category.name}'] a").each do | sub_cat_anchor |
          sub_category = SubCategory.create_or_retrieve( sub_cat_anchor.inner_html, sub_cat_anchor.attributes[ 'href' ] )
          unless category.sub_categories.include? sub_category 
            category.sub_categories << sub_category
          end
          puts " -- " + sub_category.name
        end        
      end      
    end    
  end

end