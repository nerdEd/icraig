class RemoveSubLocationTable < ActiveRecord::Migration
  def self.up
    drop_table "sub_locations"
  end

  def self.down
    create_table "sub_locations", :force => true do |t|
      t.string   "name"
      t.string   "code"
      t.integer  "location_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "url"
    end
  end
end
