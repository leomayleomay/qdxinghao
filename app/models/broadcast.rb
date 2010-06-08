class Broadcast < ActiveRecord::Base
  acts_as_hitable
  acts_as_adjacent
  acts_as_categorized_item

  validates_length_of :title, :within => 2..30, :too_long => "标题过长", :too_short => "标题过短"
  validates_length_of :body, :minimum => 2, :too_short => "内容过短"

  cattr_reader :per_page
  @@per_page = 10

  named_scope :highlight, {
    :conditions => ["broadcasts.highlighted=?", true]
  }

  def self.search(q)
    title_or_body_like(q)
  end

  def to_s
    title
  end
end
