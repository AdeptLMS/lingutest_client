# frozen_string_literal: true

require 'uri/mailto'

module LingutestClient
  class Candidate < Base
    CreateSchema = Dry::Schema.Params do
      required(:fname).filled(:string)
      required(:lname).filled(:string)
      required(:email).filled(:string, format?: URI::MailTo::EMAIL_REGEXP)
      optional(:locale).filled(:string)
      optional(:mobile).filled(:string)
      optional(:gender).filled(Types::Gender)
      optional(:ssn).filled(:string, format?: /\A([\d]{10,11}|[\d]{5,6}|^$)\z/i)
    end
    UpdateSchema = Dry::Schema.Params do
      optional(:fname).filled(:string)
      optional(:lname).filled(:string)
      optional(:email).filled(:string, format?: URI::MailTo::EMAIL_REGEXP)
      optional(:locale).filled(:string)
      optional(:mobile).filled(:string)
      optional(:gender).filled(Types::Gender)
      optional(:ssn).filled(:string, format?: /\A([\d]{10,11}|[\d]{5,6}|^$)\z/i)
    end

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
              Types::String.optional.enum('unknown', 'male', 'female')
  end
end
