class ItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :find_playlist
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def new
    @item = @playlist.items.build
    @item.build_song
  end

  def create
    @item = @playlist.items.build(params[:item])

    if @item.save
      flash[:notice] = "Item has been created."
      redirect_to [@playlist, @item]
    else
      flash[:alert] = "Item has not been created."
      render :action => "new"
    end
  end

  def show
    #binding.pry
  end

  private
    def find_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end

    def find_item
      @item = @playlist.items.find(params[:id])
    end

end
