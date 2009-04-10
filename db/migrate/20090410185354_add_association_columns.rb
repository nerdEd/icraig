class AddAssociationColumns < ActiveRecord::Migration
  def self.up
    add_column :searches, :primary_location_id, :integer    
    add_column :searches, :sub_location_id, :integer
    add_column :searches, :primary_category_id, :integer
    add_column :searches, :sub_category_id, :integer
  end

  def self.down
    remove_column :searches, :primary_location_id
    remove_column :searches, :sub_location_id
    remove_column :searches, :primary_category_id
    remove_column :searches, :sub_category_id
  end
end
