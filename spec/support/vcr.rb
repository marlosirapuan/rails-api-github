# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  vcr_mode = ENV['VCR_MODE']&.match?(/rec/i) ? :all : :once

  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.ignore_localhost = true

  config.default_cassette_options = {
    record: vcr_mode,
    match_requests_on: %i[method uri body]
  }
end
