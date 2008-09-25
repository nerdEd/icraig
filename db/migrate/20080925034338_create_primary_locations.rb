class CreatePrimaryLocations < ActiveRecord::Migration
  def self.up
    create_table :primary_locations do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :primary_locations
  end
end
