class Location < ActiveRecord::Base  
  has_and_belongs_to_many :primary_categories
  validates_uniqueness_of :name, :code, :url  
end
