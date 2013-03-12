class Song < ActiveRecord::Base
  attr_accessible :song_id, :url
  validates :url, uniqueness: true
end
