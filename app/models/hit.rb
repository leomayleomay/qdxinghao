class Hit < ActiveRecord::Base
  belongs_to :hitable, :polymorphic => true
end
