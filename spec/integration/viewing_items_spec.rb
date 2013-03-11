require 'spec_helper'

feature "Viewing items" do
  before do
    sample_playlist = Factory(:playlist, :name => "Mike's Seattle Jams")
    Factory(:item, :playlist => sample_playlist, :order => '1')

    sample_playlist_2 = Factory(:playlist, :name => "Bill's Florida Summer Jams")
    Factory(:item, :playlist => sample_playlist_2, :order => '2')

    visit '/'
  end

  scenario "Viewing items for a given playlist" do
    click_link "Mike's Seattle Jams"
    page.should have_content("1")
    page.should_not have_content("2")

    click_link "1"
    within("#item h2") do
      page.should have_content("1")
    end
  end

end
