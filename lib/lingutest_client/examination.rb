# frozen_string_literal: true

module LingutestClient
  class Examination < Base
    CreateSchema = Dry::Schema.Params do
      required(:exam_id).filled(:int?)
      required(:candidate_id).filled(:int?)
      required(:expires_at).filled(Types::Date)
      optional(:redirect_url).filled(:string, format?: /\Ahttps?:\/\/.+\z/i)
    end

    OBJECT_NAME = :examination

    include API::Resource
    include API::Operations::List.module(ExaminationList)
    include API::Operations::Create
    include API::Operations::Find

    attribute :id, Types::Integer.optional
    attribute :exam, Exam.optional.default(nil)
    attribute :candidate, Candidate.optional.default(nil)
    attribute :total_score, Types::Integer.optional.default(0)
    attribute :total_time_spent, Types::Integer.optional.default(0)
    attribute :code, Types::String.optional.default('')
    attribute :redirect_url, Types::String.optional

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
  end
end
