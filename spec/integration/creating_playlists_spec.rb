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
  end
end
