# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :faraday
  config.filter_sensitive_data('<API_KEY>') { ENV.fetch('LINGUTEST_API_KEY', nil) }
end
