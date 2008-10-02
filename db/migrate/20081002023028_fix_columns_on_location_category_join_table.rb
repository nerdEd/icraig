class FixColumnsOnLocationCategoryJoinTable < ActiveRecord::Migration
  def self.up
    remove_column :locations_primary_categories, :primary_location_id
  end

  def self.down
    add_column :locations_primary_categories, :primary_location_id, :integer
  end
end
