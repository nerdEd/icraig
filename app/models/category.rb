class Category < ActiveRecord::Base  
  validates_uniqueness_of :name, :code
  validates_presence_of :name, :code
end