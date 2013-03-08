require 'spec_helper'

feature 'Creating Playlist' do
  scenario "can create a playlist" do
    visit '/'
    click_link 'New Playlist'
    fill_in 'Name', :with => 'Test Playlist'
    fill_in 'Description', :with => 'test playlist description'
    choose('public')
    click_button 'Create Playlist'
    page.should have_content "Playlist has been created."
  end
end
