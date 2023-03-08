# frozen_string_literal: true

module LingutestClient
  class ExaminationList < Base
    include Enumerable
    delegate ::LingutestClient::Api::Operations::List::DELEGATED_METHODS => :examinations

    attribute :examinations, Types::Array.of(Examination)
  end
end
