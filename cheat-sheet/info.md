1. Create rails project files
______________________________

$ rails new app_name_here

or cd into created directory and

$ rails new


2. Add rspec and capybara gems to Gemfile
_________________________________________

group :test, :development do
  gem 'rspec-rails', '~> 2.11'
  gem 'launchy'
end
group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl'. '2.6.4'
end

2.1 Install GEMs by running

$ bundle install

in case they're not on your system already.

Note: If first time running "bundle install", you should run
$ bundle install --binstubs

This is only required first time as it places executables in the bin/ to save time when running rspec.

2.2 now setup testing environment
 
$ rails generate rspec:install


3. Decide on a feature and create a spec in spec/
________________________________________________

spec test files shoudl be stored in the below folder and terminat with _spec.rb

 spec/integration/test_filename_spec.rb

Here's a sample test...

require 'spec_helper'
feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'
    click_link 'New Project'
    fill_in 'Name', :with => 'TextMate 2'
    fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Project'
    page.should have_content('Project has been created.')
end
 end

run the spec by typing

$ rspec spec/integration/test_filename_spec.rb


4. Delete the default rails index in /public/index.html
_______________________________________________________

You delete this file as the rails app will first look in the public folder for assets.  If relevant assets now found there, it will go to the app/assets pipeline.


5. Edit config/routes.rb
________________________

The routes file uses syntax like the below to associate paths in the app with controller actions.

root :to => "projects#index"

The above says to check the ProjectsController's index action for

6. Generate the controller 
__________________________

$ rails generate controller projects


7. Define index on app/controllers/projects_controller.rb class ProjectsController < ApplicationController
  def index   end
end

then create the view for that index at app/views/projects/index.html.erb

8. Add route (resource to routes.rb) which setups all urls like /playlists/(id)
resources :projects






