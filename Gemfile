source 'https://rubygems.org'

gem 'rails', '~> 3.2.6'
gem 'dynamic_form', '~> 1.1.4'
gem 'devise'
gem 'cancan', '~> 1.6.7'
gem 'searcher', :git => "git://github.com/radar/searcher"

gem 'acts_as_list'
gem 'jquery-ui-rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
  gem 'unicorn'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'therubyracer'  # If using Ruby
  gem 'less-rails-bootstrap'
end

gem 'jquery-rails'

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.11'
  gem 'launchy' #for launching browser window html dump
  gem 'pry-debugger'
  gem 'letter_opener' #opens sign-up confirmation emails in the browser
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl', '2.6.4' #creates default values for objects
  gem 'email_spec' #provides methods for email specs that are better than default rails
  gem 'simplecov', :require => false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
