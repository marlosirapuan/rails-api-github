# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.1'
# Use sqlite3 as the database for Active Record (Heroku does not support: https://devcenter.heroku.com/articles/sqlite3)
# gem 'sqlite3', '~> 1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard
gem 'jwt'

# Simple DSL for accessing HTTP and REST resources
gem 'rest-client'

# Lib to handle the application business logic
gem 'u-case', '~> 3.1.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Load environment variables from .env into ENV
  gem 'dotenv-rails', '~> 2.7', groups: %i[development test]
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use Pry as your rails console.
  gem 'pry-rails', '~> 0.3.9'
  # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue' and 'break' commands
  # to control execution. I prefer ; )
  gem 'pry-byebug'
  # Automatic Ruby code style checking tool
  gem 'rubocop', '~> 1.0.0', require: false
  # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem 'rubocop-performance', '~> 1.7', require: false
  # Automatic Rails code style checking tool
  gem 'rubocop-rails', require: false
  # A RuboCop extension focused on enforcing Rspec best practices and coding conventions
  gem 'rubocop-rspec', require: false
  # Brings the RSpec testing framework to Ruby on Rails
  gem 'rspec-rails', '~> 4.0.2'
  # Fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails'
  # For generating fake data
  gem 'ffaker'
end

group :test do
  # Record your test suite's HTTP interactions
  gem 'vcr'
  # Library for stubbing and setting expectations on HTTP requests in Ruby
  gem 'webmock'
  # One-liner tests for common Rails functionality.
  gem 'shoulda-matchers', '~> 4.0'
  # Code coverage for test suites
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
