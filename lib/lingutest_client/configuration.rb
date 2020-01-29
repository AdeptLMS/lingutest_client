# frozen_string_literal: true

require 'dry-configurable'

module LingutestClient
  module Configuration
    def self.included(base)
      base.extend Dry::Configurable
      base.class_eval do
        setting(:api_base,
                'https://test.lingu.com/api/v1/',
                reader: true) do |value|
          URI.parse(value)
        end
        setting(:api_key, reader: true, &:to_s)
      end
    end
  end
end
