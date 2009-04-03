Given /^I have a sub location named (\w+) whose primary location is (\w+) and has primary categories named (.+)$/ do | sub_location_name, primary_location_name, category_names |
  primary_location = PrimaryLocation.create( :name => primary_location_name, :url => primary_location_name )
  sub_location = SubLocation.create( :name => sub_location_name, :url => sub_location_name )
  primary_location.sub_locations << sub_location
  category_names.split( ', ' ).each do | primary_category_name |
    sub_location.primary_categories << PrimaryCategory.create( :name => primary_category_name, :code => primary_category_name )
  end
end
