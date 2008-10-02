class SubCategory < Category
  has_and_belongs_to_many :primary_categories
end
