class CreatePrimaryLocationSubLocationJoinTable < ActiveRecord::Migration
  def self.up
    create_table "primary_categories_sub_categories", :force => true, :id => false do |t|
      t.integer "primary_category_id"
      t.integer "sub_category_id"
    end
  end

  def self.down
    drop_table "primary_categories_sub_categories"
  end
end
