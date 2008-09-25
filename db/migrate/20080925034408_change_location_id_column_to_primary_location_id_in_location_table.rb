class ChangeLocationIdColumnToPrimaryLocationIdInLocationTable < ActiveRecord::Migration
  def self.up
    remove_column :locations, :location_id
    add_column :locations, :primary_location_id, :integer
  end

  def self.down
    add_column :locations, :location_id, :integer
    remove_column :locations, :primary_location_id
  end
end
