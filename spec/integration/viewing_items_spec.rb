require 'spec_helper'

feature "Viewing items" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:user2) { Factory(:confirmed_user) }

  before do
    sample_playlist = Factory(:playlist, :name => "Mike's Seattle Jams", :user => user)
    sample_song = Factory(:song)
    Factory(:item, :playlist => sample_playlist, :title => "Sample track 1", :song => sample_song)

    sample_playlist_2 = Factory(:playlist, :name => "Bill's Florida Summer Jams", :user => user2)
    Factory(:item, :playlist => sample_playlist_2, :title => "Sample track 2", :song => sample_song)

    visit '/playlists'
  end

  scenario "Viewing items for a given playlist" do
    click_link "Mike's Seattle Jams"
    page.should have_content("Sample track 1")
    page.should_not have_content("Sample track 2")

    click_link "Sample track 1"
    within("#item h2") do
      page.should have_content("Sample track 1")
    end
  end

end
