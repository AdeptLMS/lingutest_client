# frozen_string_literal: true

require 'dry-types'
require 'uri/mailto'

module LingutestClient
  module Types
    include Dry.Types()

    DateTime = Strict::Date | JSON::Date | Strict::Time
    Time = Strict::Time | Types::JSON::Time
    Gender = Types::String.enum('unknown', 'male', 'female')
    Email = Types::String.constrained(format: URI::MailTo::EMAIL_REGEXP)
    Ssn = Types::String.constrained(format: /\A(\d{10,11}|\d{5,6}|^$)\z/i)
    Url = Types::String.constrained(format: %r{\Ahttps?://.+\z}i)
  end
end
