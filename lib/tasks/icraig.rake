require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'net/http'

namespace :icraig do
  
  desc 'scrape all Locations and Sub-Locations from Craigslist, and load them into the database'
  task :scrape_locations => :environment do
    location_doc = Hpricot( open( "http://www.craigslist.org" ) )
    
    PrimaryLocation.location_anchors_from_doc( location_doc ).each do | anchor |
      location = PrimaryLocation.create_from_anchor( anchor )
      puts location.name
      
      sub_location_file = open( location.url )
      if( !location.url.include?( sub_location_file.base_uri.host ) ) then
        # update the location url to what the original one was redirected to
      end
      SubLocation.location_anchors_from_doc( Hpricot( sub_location_file ) ).each do | sub_anchor |
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
      
      PrimaryCategory.category_anchors_from_doc( doc ).each do | category_anchor |
        category = PrimaryCategory.create_from_anchor( category_anchor )
        location.primary_categories << category
        puts category.name
        
        SubCategory.category_anchors_from_doc( doc, category.name ).each do | sub_cat_anchor |
          sub_category = SubCategory.create_from_anchor( sub_cat_anchor )
          unless category.sub_categories.include? sub_category 
            category.sub_categories << sub_category
          end
          puts " -- " + sub_category.name
        end        
      end      
    end    
  end
  
  desc 'fix PrimaryLocation URLS in the database'
  task :fix_primary_location_urls => :environment do
    PrimaryLocation.find( :all ).each do | location |
      response = Net::HTTP.get_response(URI.parse(location.url))
      case response
        when Net::HTTPRedirection then 
          new_url = response[ 'location' ]
          puts location.url + " --> " + new_url
          location.url = new_url + "/"
          location.save
      end
    end
  end

end