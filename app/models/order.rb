class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates_presence_of :user_id, :product_id, :preorder_date, :amount
  validates_numericality_of :amount, :greater_than => 0, :only_integer => true
end
