class PrimaryCategory < Category
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :sub_categories
  
  def self.create_or_retrieve( name, code )
    existing_categories = PrimaryCategory.find( :all, :conditions => [ "code = ?", code ] )
    if( existing_categories.empty? ) then
      category = PrimaryCategory.new( :name => name, :code => code )
      category.save          
    else
      category = existing_categories.first
    end
  end
end