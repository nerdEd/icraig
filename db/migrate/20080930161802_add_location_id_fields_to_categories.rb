class AddLocationIdFieldsToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :primary_location_id, :integer
    add_column :categories, :sub_location_id, :integer
  end

  def self.down
    remove_column :categories, :primary_location_id
    remove_column :categories, :sub_location_id    
  end
end
