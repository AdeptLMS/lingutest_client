# frozen_string_literal: true

module LingutestClient
  class CandidateList < Base
    include Enumerable
    delegate ::LingutestClient::API::Operations::List::DELEGATED_METHODS => :exams

    attribute :candidates, Types::Array.of(Candidate)
  end
end
