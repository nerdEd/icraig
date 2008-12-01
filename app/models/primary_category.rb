require 'rubygems'
require 'hpricot'

class PrimaryCategory < Category
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :sub_categories
  
  @@anchor_selector = "table[@summary='main'] div.ban a[@href != '/forums/']"
  
  def PrimaryCategory.create_or_retrieve( name, code )
    existing_categories = PrimaryCategory.find( :all, :conditions => [ "code = ?", code ] )
    if( existing_categories.empty? ) then
      category = PrimaryCategory.new( :name => name, :code => code )
      category.save  
      return category        
    else
      return existing_categories.first
    end
  end
  
  def PrimaryCategory.category_anchors_from_doc( doc )
    return ( doc/@@anchor_selector )
  end
  
  def PrimaryCategory.create_from_anchor( anchor_element )
    PrimaryCategory.create_or_retrieve( anchor_element.inner_html, anchor_element.attributes[ 'href' ] )     
  end
  
end