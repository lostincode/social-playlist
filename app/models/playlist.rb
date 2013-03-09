class Playlist < ActiveRecord::Base
  attr_accessible :description, :owner, :name, :shared

  validates :name, :presence => true

  validates :description, :presence => true

  validates :shared, :inclusion => {:in => [true, false]}
end
