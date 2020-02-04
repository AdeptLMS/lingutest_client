# frozen_string_literal: true

module LingutestClient
  class CandidateList < Base
    include Enumerable
    delegate %i[each size last] => :candidates

    attribute :candidates, Types::Array.of(Candidate)
  end
end
