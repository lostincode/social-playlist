#require 'open-uri'
#require 'json'

class Song < ActiveRecord::Base
  attr_accessible :url
  validates_format_of :url, :with => URI.regexp(['http'])
  #validate :validYTID
  validates :url, uniqueness: true
  # before_create :record_parsed_url

  #def record_parsed_url
  #  self.video_id = parse_youtube(self.url)
  #  self.video_id = video_id
  # end

  # def parse_youtube url
  #  regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
  #  url.match(regex)[1]
  # end

  private
    def validYTID
      #errors.add(:url, "must be a url") unless url.match(/^http/)
      #@result = JSON.parse(open("http://gdata.youtube.com/feeds/api/videos/lg6yrdhz65s?v=2&alt=jsonc").read)
      #rescue OpenURI::HTTPError => the_error
    end

end
