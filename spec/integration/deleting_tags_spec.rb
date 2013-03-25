require 'spec_helper'

feature 'Deleting Tags' do
  let!(:user) { Factory(:confirmed_user) }
  let!(:playlist) { Factory(:playlist, :name => "Bills Summer Jams", :tag_names => "this-tag-must-die", :user => user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link playlist.name
  end

  scenario "Deleting a tag", :js => true do
      click_link "delete-this-tag-must-die"
      within("#tags") do
        page.should_not have_content("this-tag-must-die")
      end
  end
end
