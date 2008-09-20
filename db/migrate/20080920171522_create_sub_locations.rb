class CreateSubLocations < ActiveRecord::Migration
  def self.up
    create_table :sub_locations do |t|
      t.string :name
      t.string :code
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sub_locations
  end
end
