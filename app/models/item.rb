class Item < ActiveRecord::Base
  default_scope :order => 'position ASC'
  belongs_to :song
  belongs_to :playlist
  belongs_to :user
  attr_accessible :title, :song_attributes
  validates :title, :presence => true
  accepts_nested_attributes_for :song

  before_validation :check_for_existing_song
  validate :check_item_count_for_user

  acts_as_list

  def check_for_existing_song
    self.song = Song.find_or_create_by_url(song.url)
  end

  def check_item_count_for_user
    # if self.user_id != self.playlist.user_id
    #   user_item_count = self.playlist.items.find_all_by_user_id(self.user_id).count
    #   if user_item_count >= 3
    #     errors.add(:item, 'You can only add 3 items per playlist')
    #   end
    # end
  end

end
