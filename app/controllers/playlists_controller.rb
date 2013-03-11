class PlaylistsController < ApplicationController
  before_filter :find_playlist, :only => [:show, :edit, :update, :destroy]
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

  def edit
  end

  def update
    if @playlist.update_attributes(params[:playlist])
      flash[:notice] = "Playlist has been updated."
      redirect_to @playlist
    else
      flash[:alert] = "Playlist has not been updated."
      render :action => "edit"
    end
  end

  def show
  end

  def destroy
    @playlist.destroy
    flash[:notice] = "Playlist has been deleted."
    redirect_to playlists_path
  end

private
  def find_playlist
    @playlist = Playlist.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The playlist you were looking for could not be found"
    redirect_to playlists_path
  end
end
