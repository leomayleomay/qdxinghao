class Product < ActiveRecord::Base
  acts_as_adjacent
  acts_as_categorized_item

  cattr_reader :per_page
  @@per_page = 10

  has_many :orders, :dependent => :destroy
  has_many :purchasers, :class_name => "User", :through => "orders"

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }
  validates_attachment_presence :image
  validates_presence_of :name, :serial_number, :model, :price, :description, :vendor
  validates_numericality_of :price, :greater_than => 0

  named_scope :highlight, {
    :conditions => ["products.highlighted=?", true]
  }

  def self.search(q)
    name_or_description_like(q)
  end

  def to_s
    name
  end
end
