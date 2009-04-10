class Search < ActiveRecord::Base
  has_one :primary_location
  has_one :sub_location
  has_one :primary_category
  has_one :sub_category
  validates_presence_of :primary_location
end
