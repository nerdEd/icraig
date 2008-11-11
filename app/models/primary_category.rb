class PrimaryCategory < Category
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :sub_categories
  
  def self.create_or_retrieve( name, code )
    existing_categories = PrimaryCategory.find( :all, :conditions => [ "code = ?", code ] )
    if( existing_categories.empty? ) then
      category = PrimaryCategory.new( :name => name, :code => code )
      category.save  
      return category        
    else
      category = existing_categories.first
    end
  end
  
  def to_s
    "<PrimaryCategory name => #{name}, code => #{code}>"
  end
  
end