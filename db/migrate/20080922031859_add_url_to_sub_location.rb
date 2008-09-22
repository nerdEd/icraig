class AddUrlToSubLocation < ActiveRecord::Migration
  def self.up
    add_column :sub_locations, :url, :string
  end

  def self.down
    remove_column :sub_locations, :url
  end
end
