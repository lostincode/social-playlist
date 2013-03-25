class Playlist < ActiveRecord::Base
  attr_accessible :description, :name, :shared, :tag_names
  attr_accessor :tag_names
  has_and_belongs_to_many :tags
  before_save :associate_tags
  scope :editable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "edit", :user_id => user.id })}

  belongs_to :user
  has_many :items, :dependent => :delete_all, :include => :song
  has_many :songs, :through => :items
  has_many :permissions, :as => :thing

  validates :name, :presence => true
  validates :description, :presence => true
  validates :shared, :inclusion => {:in => [true, false]}

  private
    def associate_tags
      if tag_names
        tag_names.split(" ").each do |name|
          self.tags << Tag.find_or_create_by_name(name)
        end
      end
    end
end
