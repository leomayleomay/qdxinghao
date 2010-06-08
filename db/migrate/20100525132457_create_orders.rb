class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :amount
      t.text :description
      t.date :preorder_date

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
