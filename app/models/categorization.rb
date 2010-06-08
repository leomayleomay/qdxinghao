class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :categorized_item, :polymorphic => true
end
