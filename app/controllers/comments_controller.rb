class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_playlist

  def create
    @comment = @playlist.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to @playlist
    else
      flash[:alert] = "Comment has not been created."
      render :template => "playlist/show"
    end
  end

  private

  def find_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end


end
