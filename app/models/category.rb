class Category < ActiveRecord::Base
  acts_as_tree :order => "name"

  validates_presence_of :name, :model
  validates_uniqueness_of :name, :scope => :parent_id
  validates_inclusion_of :model, :in => %w(broadcast product asset)
  validate :loop

  has_many :categorizations, :dependent => :destroy
  has_many :categorized_items, :through => :categorizations

  named_scope :for, lambda { |model|
    if model.blank?
      {}
    else
      {:conditions => ["categories.model = ?", model]}
    end
  }

  private
  def loop
    if self.ancestors.include? self
      self.errors.add(:parent_id, "不能作为自己的父节点")
    end
  end
end
