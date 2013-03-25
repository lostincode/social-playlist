class TagsController < ApplicationController
  def remove
    @playlist = Playlist.find(params[:playlist_id])
    if @playlist.user == current_user
      @tag = Tag.find(params[:id])
      @playlist.tags -= [@tag]
      @playlist.save
    end
  end
end
