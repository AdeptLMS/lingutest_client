# frozen_string_literal: true

module LingutestClient
  class Examination < Base
    CreateSchema = Dry::Schema.Params do
      required(:exam_id).filled(Types::Coercible::Integer)
      required(:candidate_id).filled(Types::Coercible::Integer)
      required(:expires_at).filled(Types::DateTime)
      optional(:redirect_url).filled(:string, format?: %r{\Ahttps?://.+\z}i)

      optional(:team_id).filled(Types::Coercible::String)
      optional(:team_group_id).filled(Types::Coercible::String)
      optional(:student_id).filled(Types::Coercible::String)
    end

    OBJECT_NAME = :examination

    include API::Resource
    include API::Operations::List.module(ExaminationList)
    include API::Operations::Where.module(ExaminationList)
    include API::Operations::Create
    include API::Operations::Find

    attribute :id, Types::Integer.optional
    attribute :exam, Exam.optional.default(nil)
    attribute :candidate, Candidate.optional.default(nil)
    attribute :total_score, Types::Integer.optional.default(0)
    attribute :max_score, Types::Integer.optional.default(0)
    attribute :total_time_spent, Types::Integer.optional.default(0)
    attribute :code, Types::String.optional.default('')
    attribute :redirect_url, Types::String.optional

    attribute :team_id, Types::String.optional.default(nil)
    attribute :team_group_id, Types::String.optional.default(nil)
    attribute :student_id, Types::String.optional.default(nil)

    attribute :status, Types::Integer.optional.default(0).enum(
      0 => 'pending',
      1 => 'in_progress',
      2 => 'completed',
      3 => 'pending_review',
      4 => 'reviewed'
    )

    attribute :expires_at, Types::Time.optional.default(nil)
    attribute :created_at, Types::Time.optional.default(nil)
    attribute :updated_at, Types::Time.optional.default(nil)

    def url
      URI.join(LingutestClient.config.api_base.to_s, "/#{code}").to_s
    end
  end
end
