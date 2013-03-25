class Item < ActiveRecord::Base
  belongs_to :song
  belongs_to :playlist
  belongs_to :user
  attr_accessible :title, :song_attributes
  validates :title, :presence => true
  accepts_nested_attributes_for :song

  before_validation :check_for_existing_song

  def check_for_existing_song
    self.song = Song.find_or_create_by_url(song.url)
  end

end
