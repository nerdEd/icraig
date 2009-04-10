require 'rubygems'
require 'hpricot'

class PrimaryCategory < Category
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :sub_categories
  belongs_to :search
  
  @@anchor_selector = "table[@summary='main'] div.ban a[@href != '/forums/']"
  
  def PrimaryCategory.category_anchors_from_doc( doc )
    return ( doc/@@anchor_selector )
  end
  
  def PrimaryCategory.create_from_anchor( anchor_element )
    PrimaryCategory.find_or_create_by_name_and_code( anchor_element.inner_html, anchor_element.attributes[ 'href' ] )     
  end
  
end