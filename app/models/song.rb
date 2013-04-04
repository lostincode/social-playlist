#require 'open-uri'
#require 'json'

class Song < ActiveRecord::Base
  attr_accessible :url
  validates_format_of :url, :with => URI.regexp(['http'])
  #validate :validYTID
  validates :url, uniqueness: true

  private
    def validYTID
      #errors.add(:url, "must be a url") unless url.match(/^http/)
      #@result = JSON.parse(open("http://gdata.youtube.com/feeds/api/videos/lg6yrdhz65s?v=2&alt=jsonc").read)
      #rescue OpenURI::HTTPError => the_error
    end
end
