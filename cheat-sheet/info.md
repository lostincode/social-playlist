1. Create rails project files
rails new app_name_here
or cd into created directory and rails new .

2. Add rspec and capybara gems to Gemfile
group :test, :development do
  gem 'rspec-rails', '~> 2.11'
  gem 'launchy'
end
group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl'. '2.6.4'
end
Install GEMs incase they're not on your system. --binstubs is only required first time. bundle install --binstubs
now setup testing environment rails generate rspec:install

3. Decide on a feature and create a spec in spec folder spec/integration/creating_projects_spec.rb
require 'spec_helper'
feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'
    click_link 'New Project'
    fill_in 'Name', :with => 'TextMate 2'
    fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Project'
    page.should have_content('Project has been created.')
end end
run spec by typing bin/rspec spec/integration/creating_projects_spec.rb

4. Delete the default rails index in /public/index.html
5. Edit config/routes.rb
root :to => "projects#index"
which says to check the ProjectsController's index action.
6. Generate the controller rails generate controller projects
7. Define index on app/controllers/projects_controller.rb class ProjectsController < ApplicationController
  def index   end
end

then create the view for that index at app/views/projects/index.html.erb

8. Add route (resource to routes.rb) which setups all urls like /playlists/(id)
resources :projects






