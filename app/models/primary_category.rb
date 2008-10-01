class PrimaryCategory < Category
  has_many :sub_categories
  belongs_to :location
  belongs_to :sub_location
end