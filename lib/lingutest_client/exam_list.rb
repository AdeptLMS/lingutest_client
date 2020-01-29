# frozen_string_literal: true

module LingutestClient
  class ExamList < Base
    include Enumerable
    delegate %i[each size last] => :exams

    attribute :exams, Types::Array.of(Exam)
  end
end
