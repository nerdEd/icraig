class PrimaryLocation < Location
  has_many :sub_locations
  has_many :primary_categories
  has_many :sub_categories
end
