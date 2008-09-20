require 'rubygems'
require 'hpricot'
require 'open-uri'

def scrape_locations
  location_doc = Hpricot( open( "http://www.craigslist.org" ) )
  ( location_doc/"a" ).each do | anchor |
    href = anchor.attributes[ 'href' ]
    anchor_contents = anchor.inner_html
    if( href.include?( 'http://geo.craigslist.org' ) and !anchor_contents.include?( 'more' ) ) then      
      puts anchor_contents
      sub_loc_doc = Hpricot( open( href ) )
      ( sub_loc_doc/"#list/a" ).each do | sub_anchor |
        puts "--" + sub_anchor.inner_html.delete( "<b>" ).delete( "</b>" )
      end
    end
  end
end

scrape_locations