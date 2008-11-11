class SubCategory < Category
  has_and_belongs_to_many :primary_categories
  
  def self.create_or_retrieve( name, code )
    existing_sub_categories = SubCategory.find( :all, :conditions => [ "code = ?", code ] )
    if( existing_sub_categories.empty? ) then
      sub_category = SubCategory.new( :name => name, :code => code )
      sub_category.save
      return sub_category
    else
      sub_category = existing_sub_categories.first
    end
  end
  
  def to_s
      "<SubCategory name => #{name}, code => #{code}>"
  end
  
end
