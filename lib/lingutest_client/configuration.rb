# frozen_string_literal: true

require 'dry-configurable'

module LingutestClient
  module Configuration
    def self.included(base)
      base.extend Dry::Configurable
      base.class_eval do
        setting :api_base,
                default: 'https://test.lingu.com/api/v1/',
                constructor: proc { |value| URI.parse(value) },
                reader: true

        setting :api_key,
                constructor: proc { |value| value.to_s },
                reader: true
      end
    end
  end
end
