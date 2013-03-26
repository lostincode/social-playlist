class ItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :find_playlist
  #before_filter :authorize_create!, :only => [:new, :create]
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def index
    @items = Item.order("position")
  end

  def sort
    @items = Item.all
    @items.each do |item|
    item.position = params['item'].index(item.id.to_s) + 1
    item.save
  end

  render :nothing => true
  end

  def new
    @item = @playlist.items.build
    @item.build_song
  end

  def create
    @item = @playlist.items.build(params[:item])
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item has been created."
      redirect_to @playlist
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

    def authorize_create!
      if current_user != @playlist.user && cannot?("create items".to_sym, @playlist)
        flash[:alert] = "You cannot create items on this playlist."
        redirect_to @playlist
      end
    end

end
