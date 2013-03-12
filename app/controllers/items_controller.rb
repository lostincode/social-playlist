class ItemsController < ApplicationController

  before_filter :find_playlist
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def new
    @item = @playlist.items.build
  end

  def create
    @song = Song.new
    @song.url = params[:url]
    if !@song.save
      @song = Song.find_by_url(params[:url])
    end
    @item = @playlist.items.build(params[:item])
    @item.song_id = @song.id
    if @item.save
      flash[:notice] = "Item has been created."
      redirect_to [@playlist, @item]
    else
      flash[:alert] = "Item has not been created."
      render :action => "new"
    end
  end

  def show
  end


  private
    def find_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end

    def find_item
      @item = @playlist.items.find(params[:id])
    end

end
