class Playlist < ActiveRecord::Base
  attr_accessible :description, :name, :shared
  scope :editable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "edit", :user_id => user.id })}

  belongs_to :user
  has_many :items, :dependent => :delete_all
  has_many :permissions, :as => :thing

  validates :name, :presence => true
  validates :description, :presence => true
  validates :shared, :inclusion => {:in => [true, false]}
end
