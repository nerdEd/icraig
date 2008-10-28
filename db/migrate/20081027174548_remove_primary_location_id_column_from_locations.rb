class RemovePrimaryLocationIdColumnFromLocations < ActiveRecord::Migration
  def self.up
    remove_column :locations, :primary_location_id    
  end

  def self.down
    add_column :locations, :primary_location_id, :integer
  end
end
