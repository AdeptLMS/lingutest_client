# frozen_string_literal: true

module LingutestClient
  class ExaminationList < Base
    include Enumerable
    delegate %i[each size last] => :examinations

    attribute :examinations, Types::Array.of(Examination)
  end
end
