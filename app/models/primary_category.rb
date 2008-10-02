class PrimaryCategory < Category
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :sub_categories
end