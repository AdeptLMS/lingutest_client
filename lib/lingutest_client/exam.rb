# frozen_string_literal: true

module LingutestClient
  class Exam < Base
    OBJECT_NAME = :exam

    include API::Resource
    include API::Operations::List.module(ExamList)

    attribute :id, Types::Coercible::Integer.optional.default(0)
    attribute :name, Types::Coercible::String.optional.default('')
    attribute :description, Types::Coercible::String.optional.default('')
    attribute :updated_at, Types::DateTime.optional.default(nil)
  end
end
