class AddDefaultToIsChildlessColumnInLocations < ActiveRecord::Migration
  def self.up
    remove_column :locations, :is_childless
    add_column :locations, :is_childless, :boolean, :default => true
  end

  def self.down
    remove_column :locations, :is_childless
    add_coumn :locations, :is_childless, :boolean
  end
end
