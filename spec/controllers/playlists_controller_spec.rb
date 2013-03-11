require 'spec_helper'

describe PlaylistsController do
  it "displays an error for a missing playlist" do
    get :show, :id => "not-here"
    response.should redirect_to(playlists_path)
    message = "The playlist you were looking for could not be found"
    flash[:alert].should == message
  end
end
