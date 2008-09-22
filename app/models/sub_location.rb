class SubLocation < ActiveRecord::Base
  belongs_to :location
  
  def new( a_name, a_code, a_location_id)
    name = a_name
    code = a_code
    location_id = a_location_id
  end
  
end
