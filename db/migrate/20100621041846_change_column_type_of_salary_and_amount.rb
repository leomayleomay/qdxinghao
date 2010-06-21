class ChangeColumnTypeOfSalaryAndAmount < ActiveRecord::Migration
  def self.up
    change_column :recruitments, :salary, :string
    change_column :recruitments, :amount, :string
  end

  def self.down
  end
end
