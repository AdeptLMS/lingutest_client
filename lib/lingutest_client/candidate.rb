# frozen_string_literal: true

module LingutestClient
  class Candidate < Base
    OBJECT_NAME = :candidate

    include API::Resource
    include API::Operations::List.module(CandidateList)
    include API::Operations::Create
    include API::Operations::Find
    include API::Operations::Delete
    include API::Operations::Update

    attribute :id, Types::Coercible::Integer.default(0)
    attribute :email, Types::Coercible::String.default('')
    attribute :fname, Types::Coercible::String.default('')
    attribute :lname, Types::Coercible::String.default('')
    attribute :mobile, Types::Coercible::String.default('')
    attribute :locale, Types::Coercible::String.default('')
    attribute :ssn, Types::Coercible::String.default('')
    attribute :gender,
              Types::String.optional
                           .default('undefined')
                           .enum('undefined', 'male', 'female')

    # validates :id, format: ID_REGEX
    # validates :title, presence: true
    # validates :status, presence: true
  end
end
