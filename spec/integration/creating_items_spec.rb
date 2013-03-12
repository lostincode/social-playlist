require 'spec_helper'

feature "Creating items" do
  before do
    Factory(:playlist, :name => "Bills Summer Jams")
    visit '/'
    click_link "Bills Summer Jams"
    click_link "New Item"
  end

  scenario "Creating an item" do
    fill_in "Title", :with => "Sample track title"
    fill_in "url", :with => "http://www.youtube.com/watch?v=lZD4ezDbbu4"
    click_button "Create Item"
    page.should have_content("Item has been created.")
  end

  scenario "Creating an item without valid attribute fails" do
    click_button "Create Item"
    page.should have_content("Item has not been created.")
  end
end
