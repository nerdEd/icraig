class SubLocation < Location
  belongs_to :primary_location
  has_many :primary_categories
  has_many :sub_categories
end
