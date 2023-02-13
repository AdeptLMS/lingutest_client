# frozen_string_literal: true

module LingutestClient
  class ExaminationList < Base
    include Enumerable
    delegate ::LingutestClient::API::Operations::List::DELEGATED_METHODS => :exams

    attribute :examinations, Types::Array.of(Examination)
  end
end
