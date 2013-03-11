class Item < ActiveRecord::Base
  belongs_to :playlist
  attr_accessible :order
  validates :order, :numericality => { :only_integer => true }
end
