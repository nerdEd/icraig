class DropPrimaryLocationsTable < ActiveRecord::Migration
  def self.up
    drop_table "primary_locations"
  end

  def self.down
    create_table "primary_locations", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
