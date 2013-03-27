require 'spec_helper'

feature "Creating comments" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:playlist) { Factory(:playlist, :user => user )}

before do
  sign_in_as!(user)
  visit'/playlists'
  click_link playlist.name
end

scenario "Creating a comment" do
  fill_in "Comment", :with => "Add a comment!"
  click_button "Create Comment"
  page.should have_content("Comment has been created.")
end

end
