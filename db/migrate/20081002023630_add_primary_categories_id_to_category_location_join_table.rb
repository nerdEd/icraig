class AddPrimaryCategoriesIdToCategoryLocationJoinTable < ActiveRecord::Migration
  def self.up    
    add_column :locations_primary_categories, :primary_category_id, :integer
  end

  def self.down
    remove_column :locations_primary_categories, :primary_category_id
  end
end
