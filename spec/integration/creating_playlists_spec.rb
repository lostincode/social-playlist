require 'spec_helper'

feature 'Creating Playlist' do
  before do
    visit '/'
    click_link "New Playlist"
  end

  scenario "can create a playlist" do
    fill_in 'playlist_name', :with => 'Test Playlist'
    fill_in 'playlist_description', :with => 'test playlist description'
    choose 'playlist_shared_true'
    click_button 'Create Playlist'
    page.should have_content "Your playlist has been created."

  playlist = Playlist.find_by_name("Test Playlist")
  page.current_url.should == playlist_url(playlist)
  title = "Test Playlist - Playlists - Social Playlist"
  find("title").should have_content(title)
  end

  scenario "cannot create a playlist without filling in all fields" do
    click_button 'Create Playlist'
    page.should have_content ("Playlist has not been created")
    page.should have_content ("All playlist fields must be populated")
  end
end

