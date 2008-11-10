class Location < ActiveRecord::Base  
  has_and_belongs_to_many :primary_categories
  
  def self.find_childless_locations
    locations = SubLocation.find( :all )
    locations << PrimaryLocation.find( :all, :conditions => "is_childless = 't'" )
  end
end
