class CreateJoinTableForLocationsAndPrimaryCategories < ActiveRecord::Migration
  def self.up
    create_table "locations_primary_categories", :force => true, :id => false do |t|
      t.integer "location_id"
      t.integer "primary_location_id"
    end
  end

  def self.down
    drop_table "locations_primary_categories"
  end
end
