# frozen_string_literal: true

require 'dry-types'

module LingutestClient
  module Types
    include Dry.Types()

    DateTime = Strict::Date | JSON::Date | Strict::Time
    Time = Strict::Time | Types::JSON::Time
    Gender = Types::String.enum('unknown', 'male', 'female')
  end
end
