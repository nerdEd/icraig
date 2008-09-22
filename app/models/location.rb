class Location < ActiveRecord::Base
  has_many :sub_locations
  
  def new( a_name, a_code )
    name = a_name
    code = a_code
  end
  
end
