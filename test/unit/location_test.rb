require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  fixtures :locations
  
  def test_find_childless_locations
    locations = Location.find_childless_locations
    assert_equal( locations.size, 3 )
  end
end
