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

  desc 'scrape all Categories and Sub-Categories from Craigslist, and load them into the database'
  task :scrape_categories => :environment do 
    
    # Load all categories/sub-categories for sub-locations
    sub_locations = SubLocation.find :all    
    sub_locations.each do | sub_location |
      puts sub_location.url
      doc = Hpricot( open( sub_location.url ) )  
      ( doc/"table[@summary='main'] div.ban a[@href != '/forums/']" ).each do | category_anchor |
        name = category_anchor.inner_html
        code = category_anchor.attributes[ 'href' ]
        
        # Only create a new category if this one doesn't already exist
        existing_categories = PrimaryCategory.find( :all, :conditions => [ "code = ?", code ] )
        if( existing_categories.empty? ) then
          category = PrimaryCategory.new( :name => name, :code => code )
          category.save          
        else
          category = existing_categories.first
        end
        
        # Add the current category to the current sub-location        
        sub_location.primary_categories << category
        puts name
        
        # Fetch all sub-categories for this category
        ( doc/"table.w2[@summary='#{category.name}'] a").each do | sub_cat_anchor |
                    
          sub_name = sub_cat_anchor.inner_html
          sub_code = sub_cat_anchor.attributes[ 'href' ]
          
          #Only create a new sub-category if this one doesn't already exist
          existing_sub_categories = SubCategory.find( :all, :conditions => [ "code = ?", code ] )
          if( existing_sub_categories.empty? ) then
            sub_category = SubCategory.new( :name => name, :code => code )
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