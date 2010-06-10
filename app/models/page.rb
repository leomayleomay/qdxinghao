class Page < ActiveRecord::Base
  acts_as_hitable

  validates_presence_of :title, :body
  validates_length_of :title, :within => 2..30, :too_long => "标题过长", :too_short => "标题过短"
  validates_length_of :body, :minimum => 2, :too_short => "内容过短"

  named_scope :highlight, {
    :conditions => ["pages.highlighted=?", true]
  }

  def destroyable?
    !%w(公司简介).include?(title)
  end
end
