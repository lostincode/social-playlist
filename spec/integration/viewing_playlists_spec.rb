require 'spec_helper'

feature "Viewing playlists" do
  scenario "Listing all playlists" do
    playlist = Factory.create(:playlist, :name => "Test Playlist")
    visit '/'
    click_link 'Test Playlist'
    page.current_url.should == playlist_url(playlist)
  end
end
