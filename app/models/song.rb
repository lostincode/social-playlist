class Song < ActiveRecord::Base
  attr_accessible :url
  validates :url, uniqueness: true
  validates_format_of :url, :with => URI.regexp(['http'])
end
