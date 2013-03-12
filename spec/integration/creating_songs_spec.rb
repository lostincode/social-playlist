require 'spec_helper'

feature "Creating songs" do
  before do
    Factory(:playlist, :name => "Bills Summer Jams")
    visit '/'
    click_link "Bills Summer Jams"
    click_link "New Item"
    fill_in "Order", :with => "1"
    fill_in "Title", :with => "MichaelBoltonRocks"
    click_button "Create Item"
  end

  scenario "Creating a song" do
    click_link "New Song"
    fill_in "Song URL", :with => "http://www.youtube.com/watch?v=lZD4ezDbbu4"
    click_button "Create Song"
    page.should have_content("Song has been created.")
  end

  scenario "Creating a song without valid attribute fails" do
    click_button "Create Song"
    page.should have_content("Song has not been created.")
    page.should have_content("URL must be populated with a valid web address")
  end

end
