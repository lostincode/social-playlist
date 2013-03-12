class Item < ActiveRecord::Base
  belongs_to :song
  belongs_to :playlist
  attr_accessible :order, :title
  validates :order, :numericality => { :only_integer => true }
  validates :title, :presence => true
end
