require 'spec_helper'

feature "Viewing playlists" do
  let!(:user) {Factory(:user) }
  let!(:playlist) {Factory(:playlist, :name => "Mike's Seattle Jams") }

  before do
    playlist.update_attribute(:user, user)
  end

  scenario "Listing all playlists" do
    visit '/'
    click_link "Mike's Seattle Jams"
    page.current_url.should == playlist_url(playlist)
  end
end
