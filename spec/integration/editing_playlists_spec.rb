require 'spec_helper'

feature "Editing Playlists" do
  let!(:user) {Factory(:confirmed_user) }

  before do
    Factory(:playlist, :name => "TextMate 2", :user => user)
    sign_in_as!(user)
    visit '/playlists'
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
