require 'spec_helper'

feature 'Creating Playlist' do
  scenario "can create a playlist" do
    visit '/'
    click_link 'New Playlist'
    fill_in 'playlist_name', :with => 'Test Playlist'
    fill_in 'playlist_description', :with => 'test playlist description'
    # choose('public')
    click_button 'Create Playlist'
    page.should have_content "Your playlist has been created."

  playlist = Playlist.find_by_name("Test Playlist")
  page.current_url.should == playlist_url(playlist)
  title = "Test Playlist - Playlists - Social Playlist"
  find("title").should have_content(title)

  end
end

