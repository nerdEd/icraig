Given /^I have primary locations named (.+)$/ do | names |
  names.split(', ').each do | name |
    PrimaryLocation.create!( :name => name, :url => "www.icraig-#{name}org" )
  end
end

Given /^I have a primary location named (\w+) with sub locations named (.+)$/ do | location_name, sub_location_names |
  primary_location = PrimaryLocation.create!( :name => location_name, :url => "www.icraig.org" )
  sub_location_names.split(', ').each do | sub_location_name |
    primary_location.sub_locations << SubLocation.create!( :name => sub_location_name, :url => "www.icraig-#{sub_location_name}org" )
  end
end

Given /^I have a primary location named (\w+) with primary categories named(.+)$/ do | location_name, primary_category_names |
  primary_location = PrimaryLocation.create!( :name => location_name, :url => "www.icraig.org" )
  primary_category_names.split(', ').each do | primary_category_name |
    primary_location.primary_categories << PrimaryCategory.create!( :name => primary_category_name, :code => primary_category_name )
  end
end
