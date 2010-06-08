class Message < ActiveRecord::Base
  validates_presence_of :user_id, :title, :body
  validates_length_of :title, :within => 2..30, :too_long => "标题过长", :too_short => "标题过短"
  validates_length_of :body, :minimum => 2, :too_short => "内容过短"

  cattr_reader :per_page
  @@per_page = 5

  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
end
