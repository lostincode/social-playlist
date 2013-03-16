class Playlist < ActiveRecord::Base
  has_many :items, :dependent => :delete_all
  attr_accessible :description, :name, :shared
  belongs_to :user
  validates :name, :presence => true
  validates :description, :presence => true
  validates :shared, :inclusion => {:in => [true, false]}
end
