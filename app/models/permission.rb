class Permission < ActiveRecord::Base
  attr_accessible :user, :action, :thing
  belongs_to :user, :polymorphic => true
end
