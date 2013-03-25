require 'spec_helper'

feature 'Creating Playlist' do
  let!(:playlist) { Factory(:playlist, :name => "Bills Summer Jams") }
  let!(:user) { Factory(:confirmed_user, :email => "user@social-playlist.com") }

  before do
    visit '/'
    sign_in_as!(user)
    click_link "New Playlist"
    within("h2") { page.should have_content("New Playlist") }
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
    within("#playlist #user") do
      page.should have_content("created by user")
    end
  end

  scenario "cannot create a playlist without filling in all fields" do
    click_button 'Create Playlist'
    page.should have_content ("Playlist has not been created")
    page.should have_content ("3 errors prohibited this playlist from being saved")
  end
end

