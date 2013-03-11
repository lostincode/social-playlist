class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(params[:playlist])
    if @playlist.save
      flash[:notice] = "Your playlist has been created."
      redirect_to @playlist
    else
      flash[:alert] = "Playlist has not been created"
      render :action => "new"
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    flash[:notice] = "Playlist has been deleted."
    redirect_to playlists_path
  end

end
