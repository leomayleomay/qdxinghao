class Asset < ActiveRecord::Base
  acts_as_categorized_item

  cattr_reader :per_page
  @@per_page = 10

  has_attached_file :attachment
  validates_attachment_presence :attachment
  validates_presence_of :name
  validates_length_of :name, :within => 2..30, :too_long => "名称过长", :too_short => "名称过短"
  validates_length_of :description, :minimum => 2, :too_short => "内容过短"

  def self.search(q)
    name_or_description_like(q)
  end
 
  def to_s
    name
  end
end
