class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :serial_number
      t.string :model
      t.float :price
      t.text :description
      t.string :vendor
      t.boolean :highlighted, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
