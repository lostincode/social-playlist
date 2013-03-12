class Item < ActiveRecord::Base
  belongs_to :song
  belongs_to :playlist
  attr_accessible :order, :title
  validates :title, :presence => true
end
