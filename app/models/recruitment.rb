class Recruitment < ActiveRecord::Base
  validates_presence_of :title, :address, :amount, :salary, :description
  validates_length_of :title, :within => 2..30
  validates_length_of :address, :minimum => 2
  validates_length_of :description, :minimum => 2

  validates_numericality_of :amount, :salary, :greater_than => 0
end
