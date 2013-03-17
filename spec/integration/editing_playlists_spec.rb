require 'spec_helper'

feature "Editing Playlists" do
  before do
    user = Factory(:user, :email => "user@social-playlist.com")
    user.confirm!
    Factory(:playlist, :name => "TextMate 2", :user => user)
    sign_in_as!(user)
    visit '/'
    click_link "TextMate 2"
    click_link "Edit Playlist"
  end

  scenario "Updating a playlist" do
    fill_in "Name", :with => "TextMate 2 beta"
    click_button "Update Playlist"
    page.should have_content("Playlist has been updated.")
  end

  scenario "Updating a playlist with an invalid attribute is bad" do
    fill_in "Name", :with => ""
    click_button "Update Playlist"
    page.should have_content("Playlist has not been updated.")
  end
end
