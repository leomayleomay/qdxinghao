class Recruitment < ActiveRecord::Base
  validates_presence_of :title, :address, :amount, :salary, :description
  validates_length_of :title, :within => 2..30
  validates_length_of :address, :minimum => 2
  validates_length_of :description, :minimum => 2

  cattr_reader :per_page
  @@per_page = 5
end
