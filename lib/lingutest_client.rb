# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)
require 'dry-configurable'
require 'dry-schema'
require 'dry-struct'
require 'dry-types'
require 'forwardable'
require 'zeitwerk'

Zeitwerk::Loader.for_gem.setup

module LingutestClient
  extend Dry::Configurable

  setting :api_base,
          default: 'https://test.lingu.com/api/v1/',
          constructor: proc { |value| URI.parse(value) },
          reader: true

  setting :api_key,
          constructor: proc { |value| value.to_s },
          reader: true
end
