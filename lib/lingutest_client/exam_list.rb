# frozen_string_literal: true

module LingutestClient
  class ExamList < Base
    include Enumerable
    delegate ::LingutestClient::Api::Operations::List::DELEGATED_METHODS => :exams

    attribute :exams, Types::Array.of(Exam)
  end
end
