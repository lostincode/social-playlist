require 'spec_helper'

feature "Creating items" do
  before do
    Factory(:playlist, :name => "Bills Summer Jams")
    visit '/'
    click_link "Bills Summer Jams"
    click_link "New Item"
    click_button "Create Item"
  end

  scenario "Creating a item" do
    fill_in "Title", :with => "Test song title"
    fill_in "Url", :with => "http://www.youtube.com/watch?v=lZD4ezDbbu4"
    click_button "Create Item"
    page.should have_content("Item has been created.")
  end

  scenario "Creating a item without filling in fields fails" do
    click_button "Create Item"
    page.should have_content("Item has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Song url is invalid")
  end

  scenario "Creating a item without valid URL fails" do
    fill_in "Title", :with => "Testing invalid URL"
    fill_in "Url", :with => "ftp://somecrazyurl.com"
    click_button "Create Item"
    page.should have_content("Item has not been created.")
    page.should have_content("Song url is invalid")
  end

end
