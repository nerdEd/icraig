class RemoveOldAssociationColumnsFromCategories < ActiveRecord::Migration
  def self.up
    remove_column :categories, :primary_location_id
    remove_column :categories, :primary_category_id
  end

  def self.down
    add_column :categories, :primary_location_id, :integer
    add_column :categories, :primary_category_id, :integer
  end
end
