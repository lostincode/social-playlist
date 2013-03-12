require 'spec_helper'

feature "Editing Playlists" do
  scenario "Updating a playlist" do
    Factory(:playlist, :name => "TextMate 2")
    visit "/"
    click_link "TextMate 2"
    click_link "Edit Playlist"
    fill_in "Name", :with => "TextMate 2 beta"
    click_button "Update Playlist"
    page.should have_content("Playlist has been updated.")
  end
end
