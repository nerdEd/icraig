class Location < ActiveRecord::Base  
  has_and_belongs_to_many :primary_categories
  validates_uniqueness_of :name, :url  
  validates_presence_of :name, :url
end
