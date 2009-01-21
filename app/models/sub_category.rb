class SubCategory < Category
  has_and_belongs_to_many :primary_categories
  
  def SubCategory.category_anchors_from_doc( doc, category_name )
    return  ( doc/"table.w2[@summary='#{category_name}'] a")
  end
  
  def SubCategory.create_from_anchor( anchor_element )
    SubCategory.find_or_create_by_name_and_code( anchor_element.inner_html, anchor_element.attributes[ 'href' ] )     
  end
  
end