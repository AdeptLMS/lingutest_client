# frozen_string_literal: true

module LingutestClient
  class Exam < Base
    OBJECT_NAME = :exam

    include Api::Resource
    include Api::Operations::List.module(ExamList)

    FilterSchema = Dry::Schema.Params do
      config.validate_keys = true
      optional(:page).filled(Types::Coercible::Integer)
      optional(:per_page).filled(Types::Coercible::Integer)

      optional(:locale_eq).filled(Types::Coercible::String)
      optional(:price_gt).filled(Types::Coercible::Integer)
    end

    attribute :id,          Types::Coercible::Integer.optional.default(0)
    attribute :name,        Types::Coercible::String.optional.default('')
    attribute :locale,      Types::Coercible::String.optional.default('')
    attribute :description, Types::Coercible::String.optional.default('')
    attribute :price,       Types::Coercible::Decimal.optional.default(0)
    attribute :updated_at,  Types::DateTime.optional.default(nil)
    attribute :created_at,  Types::DateTime.optional.default(nil)
  end
end
