namespace :icraig do
  
  task :scrape => [ :scrape_locations, :scrape_categories ]
  
  task :scrape_locations => :scrape_sub_locations do
    attention "Locations"
  end

  task :scrape_sub_locations => :scrape_sub_sub_locations do
    attention "Sub-Locations"
  end

  task :scrape_sub_sub_locations do
    attention "Sub-Sub-Locations"
  end

  task :scrape_categories => :scrape_sub_categories do 
    attention "Categories"
  end
  
  task :scrape_sub_categories do
    attention "Sub-Categories"
  end

  def attention(msg)
    puts "!!!!!!!!!! #{msg}"
  end
end