class UpdateCategoriesTableForSingleTableInheritance < ActiveRecord::Migration
  def self.up
    add_column :categories, :primary_category_id, :integer
    add_column :categories, :type, :string
  end

  def self.down
    remove_column :categories, :primary_category_id
    remove_column :categories, :type
  end
end
