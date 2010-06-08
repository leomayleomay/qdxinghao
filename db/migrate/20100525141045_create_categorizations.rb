class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.integer :category_id
      t.integer :categorized_item_id
      t.string :categorized_item_type

      t.timestamps
    end
  end

  def self.down
    drop_table :categorizations
  end
end
