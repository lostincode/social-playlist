class Playlist < ActiveRecord::Base
  attr_accessible :description, :owner, :name, :shared
end
