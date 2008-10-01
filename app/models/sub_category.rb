class SubCategory < Category
  belongs_to :primary_category
  belongs_to :location
  belongs_to :sub_location
end
