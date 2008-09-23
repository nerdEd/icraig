class Location < ActiveRecord::Base
  has_many :sub_locations
end
