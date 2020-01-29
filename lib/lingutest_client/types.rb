# frozen_string_literal: true

require 'dry-types'

module LingutestClient
  module Types
    include Dry.Types()

    Date = Strict::Date | JSON::Date
    Time = Strict::Time | Types::JSON::Time
  end
end
