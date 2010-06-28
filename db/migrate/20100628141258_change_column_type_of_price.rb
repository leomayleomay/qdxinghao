class ChangeColumnTypeOfPrice < ActiveRecord::Migration
  def self.up
    change_column :products, :price, :string
  end

  def self.down
  end
end
