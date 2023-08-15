# frozen_string_literal: true

module LingutestClient
  class Candidate < Base
    CreateSchema = Dry::Schema.Params do
      required(:fname).filled(:string)
      required(:lname).filled(:string)
      required(:email).filled(Types::Email)
      optional(:locale).filled(:string)
      optional(:mobile).filled(:string)
      optional(:gender).filled(Types::Gender)
      optional(:ssn).filled(Types::Ssn)
    end
    UpdateSchema = Dry::Schema.Params do
      optional(:fname).filled(:string)
      optional(:lname).filled(:string)
      optional(:email).filled(Types::Email)
      optional(:locale).filled(:string)
      optional(:mobile).filled(:string)
      optional(:gender).filled(Types::Gender)
      optional(:ssn).filled(Types::Ssn)
    end

    FilterSchema = Dry::Schema.Params do
      optional(:page)
      optional(:per_page)
      optional(:email_eq).filled(Types::Email)
      optional(:fname_eq).filled(:string)
      optional(:lname_eq).filled(:string)
    end

    OBJECT_NAME = :candidate

    include Api::Resource
    include Api::Operations::List.module(CandidateList, FilterSchema)
    include Api::Operations::Create
    include Api::Operations::Find
    include Api::Operations::Delete
    include Api::Operations::Update

    attribute :id, Types::Coercible::Integer.default(0)
    attribute :email, Types::Coercible::String.default('')
    attribute :fname, Types::Coercible::String.default('')
    attribute :lname, Types::Coercible::String.default('')
    attribute :mobile, Types::Coercible::String.default('')
    attribute :locale, Types::Coercible::String.default('')
    attribute :ssn, Types::Coercible::String.default('')
    attribute :gender, Types::Gender
  end
end
