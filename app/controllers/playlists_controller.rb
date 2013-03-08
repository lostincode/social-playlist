class PlaylistsController < ApplicationController
  def index
  end
  def new
    @playlist = Playlist.new
  end
end
