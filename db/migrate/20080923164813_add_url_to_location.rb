class AddUrlToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :url, :string
  end

  def self.down
    remove_column :locations, :url
  end
end
