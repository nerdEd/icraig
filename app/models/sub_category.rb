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
  
  def self.category_anchors_from_doc( doc, category_name )
    return  ( doc/"table.w2[@summary='#{category_name}'] a")
  end
  
  def self.create_from_anchor( anchor_element )
    SubCategory.create_or_retrieve( anchor_element.inner_html, anchor_element.attributes[ 'href' ] )     
  end
  
end
