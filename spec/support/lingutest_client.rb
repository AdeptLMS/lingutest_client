# frozen_string_literal: true

require 'lingutest_client'

LingutestClient.configure do |config|
  config.api_base = ENV.fetch('LINGUTEST_API_BASE', 'https://test.lingu.com/api/v1/')
  config.api_key = ENV.fetch('LINGUTEST_API_KEY', 'test_api_key')
end
