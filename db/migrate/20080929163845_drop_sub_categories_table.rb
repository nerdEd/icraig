class DropSubCategoriesTable < ActiveRecord::Migration
  def self.up
    drop_table "sub_categories"
  end

  def self.down
    create_table "sub_categories", :force => true do |t|
      t.string   "name"
      t.string   "code"
      t.integer  "category_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
