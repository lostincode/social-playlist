require 'spec_helper'

feature "Creating items" do
  let!(:playlist_owner_user) { Factory(:confirmed_user) }
  let!(:no_permission_user) { Factory(:confirmed_user) }
  let!(:has_permission_user) { Factory(:confirmed_user) }
  let!(:playlist) { Factory(:playlist, :name => "Bills Summer Jams", :user => playlist_owner_user) }

  context "Playlist owner" do
    before do
      sign_in_as!(playlist_owner_user)
      visit '/'
      click_link playlist.name
      click_link "New Item"
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

  context "Unauthorized user" do
    before do
      sign_in_as!(no_permission_user)
      visit '/'
      click_link playlist.name
      click_link "New Item"
    end

    scenario "Creating an item with a user who has permission" do
      page.should have_content("You cannot create items on this playlist.")
    end
  end

  context "Authorized user" do
    before do
      sign_in_as!(has_permission_user)
      define_permission!(has_permission_user, "create items", playlist)
      visit '/'
      click_link playlist.name
      click_link "New Item"
    end

    scenario "Creating an item with a user who has permission" do
      fill_in "Title", :with => "Test song title"
      fill_in "Url", :with => "http://www.youtube.com/watch?v=lZD4ezDbbu4"
      click_button "Create Item"
      page.should have_content("Item has been created.")
    end
  end

end
