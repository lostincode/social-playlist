require 'spec_helper'

feature "Deleting playlists" do

  scenario "Deleting a playlist" do
    Factory(:playlist, :name => "Test Playlist")
    visit '/'
    click_link "Test Playlist"
    click_link "Delete Playlist"
    page.should have_content("Playlist has been deleted.")

    visit '/'
    page.should_not have_content("Test Playlist")
  end

end
