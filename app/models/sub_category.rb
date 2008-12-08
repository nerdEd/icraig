class SubCategory < Category
  has_and_belongs_to_many :primary_categories
  
  def SubCategory.create_or_retrieve( name, code )
    begin
      SubCategory.create( :name => name, :code => code )      
    rescue
      return SubCategory.find( :all, :conditions => [ "code = ?", code ] ).first
    end
  end
  
  def SubCategory.category_anchors_from_doc( doc, category_name )
    return  ( doc/"table.w2[@summary='#{category_name}'] a")
  end
  
  def SubCategory.create_from_anchor( anchor_element )
    SubCategory.create_or_retrieve( anchor_element.inner_html, anchor_element.attributes[ 'href' ] )     
  end
  
end
