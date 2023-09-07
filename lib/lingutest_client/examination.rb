# frozen_string_literal: true

module LingutestClient
  class Examination < Base
    OBJECT_NAME = :examination

    STATUSES = %w[
      pending
      in_progress
      completed
      pending_review
      reviewed
    ].freeze

    CreateSchema = Dry::Schema.Params do
      required(:exam_id).filled(Types::Coercible::Integer)
      required(:candidate_id).filled(Types::Coercible::Integer)
      required(:expires_at).filled(Types::DateTime)
      optional(:redirect_url).filled(Types::Url)

      optional(:team_id).filled(Types::Coercible::String)
      optional(:team_group_id).filled(Types::Coercible::String)
      optional(:student_id).filled(Types::Coercible::String)
    end

    FilterSchema = Dry::Schema.Params do
      config.validate_keys = true
      optional(:page).filled(Types::Coercible::Integer)
      optional(:per_page).filled(Types::Coercible::Integer)

      optional(:team_id_eq).filled(Types::Coercible::String)
      optional(:team_group_id_eq).filled(Types::Coercible::String)
      optional(:student_id_eq).filled(Types::Coercible::String)

      optional(:price_gteq).filled(Types::Coercible::Integer)
      optional(:created_at_gteq).filled(Types::DateTime)
      optional(:created_at_lteq).filled(Types::DateTime)
    end

    include Api::Resource
    include Api::Operations::List.module(ExaminationList, FilterSchema)
    include Api::Operations::Create
    include Api::Operations::Find

    attribute :id, Types::Integer.optional
    attribute :exam, Exam.optional.default(nil)
    attribute :candidate, Candidate.optional.default(nil)
    attribute :total_score, Types::Integer.optional.default(0)
    attribute :max_score, Types::Integer.optional.default(0)
    attribute :tasks_limit, Types::Integer.optional.default(0)
    attribute :total_time_spent, Types::Integer.optional.default(0)
    attribute :code, Types::String.optional.default('')
    attribute :redirect_url, Types::String.optional
    attribute :price, Types::Coercible::Decimal.optional.default(0)

    attribute :team_id, Types::String.optional.default(nil)
    attribute :team_group_id, Types::String.optional.default(nil)
    attribute :student_id, Types::String.optional.default(nil)

    attribute :status, Types::String.optional.enum(*STATUSES)

    attribute :expires_at, Types::Time.optional.default(nil)
    attribute :created_at, Types::Time.optional.default(nil)
    attribute :updated_at, Types::Time.optional.default(nil)

    def url
      URI.join(LingutestClient.config.api_base.to_s, "/#{code}").to_s
    end

    def result_url
      URI.join(LingutestClient.config.api_base.to_s, "/examinations/#{code}").to_s
    end

    STATUSES.each do |status|
      define_method "#{status}?" do
        self.status == status
      end
    end
  end
end
