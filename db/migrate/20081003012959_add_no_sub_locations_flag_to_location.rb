class AddNoSubLocationsFlagToLocation < ActiveRecord::Migration
  def self.up
     add_column :locations, :is_childless, :boolean
  end

  def self.down
    remove_column :locations, :is_childless
  end
end
