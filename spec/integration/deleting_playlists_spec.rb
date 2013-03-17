require 'spec_helper'

feature "Deleting playlists" do
  let!(:user) {Factory(:confirmed_user) }
  let!(:playlist) {Factory(:playlist, :name => "Mike's Seattle Jams") }

  before do
    sign_in_as!(user)
    playlist.update_attribute(:user, user)
  end

  scenario "Deleting a playlist" do
    visit '/'
    click_link "Mike's Seattle Jams"
    click_link "Delete Playlist"
    page.should have_content("Playlist has been deleted.")

    visit '/'
    page.should_not have_content("Test Playlist")
  end

end
