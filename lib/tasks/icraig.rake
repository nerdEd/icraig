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

  desc 'scrape all Categories and Sub-Categories from Craigslist, and load them into the database, also... holy shit this task is too big.'
  task :scrape_categories => :environment do 
    
    locations = Location.locations_with_categories
    
    # Load all categories/sub-categories for sub-locations
    locations.each do | location |
          
      puts 'Currently Scraping: ' + location.name
      
      doc = Hpricot( open( location.url ) )
      ( doc/"table[@summary='main'] div.ban a[@href != '/forums/']" ).each do | category_anchor |

        # create a new category if the one we're parsing doesn't already exist
        name = category_anchor.inner_html
        code = category_anchor.attributes[ 'href' ]      
        category = PrimaryCategory.create_or_retrieve( name, code )
        
        # Add the current category to the current sub-location        
        location.primary_categories << category
        puts name
        
        # Fetch all sub-categories for this category
        ( doc/"table.w2[@summary='#{category.name}'] a").each do | sub_cat_anchor |
                    
          sub_name = sub_cat_anchor.inner_html
          sub_code = sub_cat_anchor.attributes[ 'href' ]
          
          # Only create a new sub-category if this one doesn't already exist
          existing_sub_categories = SubCategory.find( :all, :conditions => [ "code = ?", code ] )
          if( existing_sub_categories.empty? ) then
            sub_category = SubCategory.new( :name => sub_name, :code => sub_code )
            sub_category.save
          else
            sub_category = existing_sub_categories.first
          end
          
          # Add the current sub-category to the current category
          category.sub_categories << sub_category
          puts " -- " + sub_name
        end
      end
    end
    
    # TODO: Load all categories for locations (without sub-locations)
  end
  
end