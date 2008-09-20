require 'lib/scraper/scraper.rb'

namespace :icraig do
  task :scrape => [ :scrape_locations, :scrape_categories ]
  
  task :scrape_locations => :scrape_sub_locations do
    puts "Locations"
  end

  task :scrape_sub_locations => :scrape_sub_sub_locations do
    puts "-Sub-Locations"
  end

  task :scrape_sub_sub_locations do
    puts "--Sub-Sub-Locations"
  end

  task :scrape_categories => :scrape_sub_categories do 
    puts "Categories"
  end
  
  task :scrape_sub_categories do
    puts "-Sub-Categories"
  end
end