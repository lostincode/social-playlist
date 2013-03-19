require 'spec_helper'

describe ItemsController do
  let!(:playlist_owner_user) { Factory(:confirmed_user) }
  let!(:no_permission_user) { Factory(:confirmed_user) }
  let!(:playlist) { Factory(:playlist, :name => "Bills Summer Jams", :user => playlist_owner_user) }

  context "No permission user" do
    before do
      sign_in(:user, no_permission_user)
      visit '/'
    end

    def cannot_create_items!
      response.should redirect_to(playlist_path(playlist))
      flash[:alert].should eql("You cannot create items on this playlist.")
    end

    it "Cannot access add item page for a playlist" do
      get :new, :playlist_id => playlist.id
      cannot_create_items!
    end

    it "Cannot create an item without permission" do
      post :create, :playlist_id => playlist.id
      cannot_create_items!
    end

  end

end
