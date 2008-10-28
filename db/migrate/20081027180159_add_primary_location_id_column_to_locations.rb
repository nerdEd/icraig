class AddPrimaryLocationIdColumnToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :primary_location_id, :integer
  end

  def self.down
    remove_column :locations, :primary_location_id
  end
end
