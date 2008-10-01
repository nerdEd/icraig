class ChangeCategoryTableToOnlyHaveLocationFKey < ActiveRecord::Migration
  def self.up
    add_column :categories, :location_id, :integer
  end

  def self.down
    remove_column :categories, :location_id, :integer
  end
end
