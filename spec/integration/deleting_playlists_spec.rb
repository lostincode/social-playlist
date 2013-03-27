require 'spec_helper'

feature "Deleting playlists" do
  let!(:user) {Factory(:confirmed_user) }
  let!(:user_normal) {Factory(:confirmed_user) }
  let!(:playlist) {Factory(:playlist, :name => "Mike's Seattle Jams", :user => user) }

  before do
  end

  scenario "Deleting a playlist" do
    sign_in_as!(user)
    visit '/playlists'
    click_link "Mike's Seattle Jams"
    click_link "Delete Playlist"
    page.should have_content("Playlist has been deleted.")

    visit '/playlists'
    page.should_not have_content("Test Playlist")
  end

  scenario "Only owner can delete his/her playlist" do
    sign_in_as!(user_normal)
    visit '/playlists'
    click_link "Mike's Seattle Jams"
    page.should_not have_content("Delete Playlist")
  end

end
