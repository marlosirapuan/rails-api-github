# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter [
    'config/initializers',
    'config/routes.rb',
    'app/helpers',
    'app/mailers',
    'app/channels',
    'app/jobs'
  ]
end
