class RemoveLocationIdFromCategory < ActiveRecord::Migration
  def self.up
    remove_column :categories, :location_id
  end

  def self.down
    add_column :categories, :location_id, :integer
  end
end
