require 'spec_helper'

feature "Creating items" do
  before do
    Factory(:playlist, :name => "Bills Summer Jams")
    visit '/'
    click_link "Bills Summer Jams"
    click_link "New Item"
  end

  scenario "Creating an item" do
    fill_in "Order", :with => "1"
    click_button "Create Item"
    page.should have_content("Item has been created.")
  end

  scenario "Creating an item without valid attribute fails" do
    click_button "Create Item"
    page.should have_content("Item has not been created.")
    page.should have_content("Order is not a number")
  end

end
