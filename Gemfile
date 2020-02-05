source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# For REST services
gem 'rest-client', '~> 2.1'
# Debugging tool
gem 'pry', '~> 0.12.2'
# To define which model attributes and relationships need to be serialized
gem 'active_model_serializers', '~> 0.10.10'
# Use ActiveModel, has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
# Manage JSON Web tokens
gem 'jwt', '~> 2.2', '>= 2.2.1'
# Use postgresql as the database for Active Record
# gem 'postgresql', '~> 1.0'
# PAGINATION
gem 'will_paginate'
gem 'api-pagination'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
 # having it this way in test and dev envs works
gem 'dotenv-rails', groups: [:development, :test]


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # adding rspec testing framework
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
    # create fake data
  gem 'faker', '~> 2.5'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails', '~> 5.1'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'database_cleaner', '~> 1.7'
end

group :production do
  gem 'pg', '>= 0.18', '< 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
